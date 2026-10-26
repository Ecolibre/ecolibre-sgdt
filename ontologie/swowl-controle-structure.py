import sys
from collections import Counter
from rdflib import Graph, BNode, Literal, RDF, RDFS, OWL

def court(x):
    t = str(x)
    return t.rsplit("#", 1)[-1] if "#" in t else t.rsplit("/", 1)[-1]

def expression(g, noeud, profondeur=0):
    """Signature textuelle d'une expression de classe, nommée ou anonyme."""
    if not isinstance(noeud, BNode):
        return court(noeud)
    if profondeur > 6:
        return "..."
    for operateur, etiquette in ((OWL.unionOf, "ou"), (OWL.intersectionOf, "et")):
        for liste in g.objects(noeud, operateur):
            membres = sorted(expression(g, m, profondeur + 1) for m in g.items(liste))
            return "(" + f" {etiquette} ".join(membres) + ")"
    for complement in g.objects(noeud, OWL.complementOf):
        return "non " + expression(g, complement, profondeur + 1)
    if (noeud, RDF.type, OWL.Restriction) in g:
        return restriction(g, noeud, profondeur + 1)
    for liste in g.objects(noeud, OWL.oneOf):
        return "{" + ", ".join(sorted(court(m) for m in g.items(liste))) + "}"
    return "anonyme non reconnu"

def restriction(g, noeud, profondeur=0):
    propriete = ", ".join(sorted(court(p) for p in g.objects(noeud, OWL.onProperty)))
    morceaux = []
    for contrainte in (OWL.allValuesFrom, OWL.someValuesFrom, OWL.hasValue, OWL.onClass,
                       OWL.cardinality, OWL.minCardinality, OWL.maxCardinality,
                       OWL.qualifiedCardinality, OWL.minQualifiedCardinality,
                       OWL.maxQualifiedCardinality):
        for valeur in g.objects(noeud, contrainte):
            rendu = str(valeur) if isinstance(valeur, Literal) else expression(g, valeur, profondeur)
            morceaux.append(f"{court(contrainte)}={rendu}")
    if not morceaux:
        morceaux.append("SANS CONTRAINTE")
    return f"restriction[{propriete}: {', '.join(sorted(morceaux))}]"

def signatures(chemin):
    g = Graph(); g.parse(chemin, format="xml")
    sacs = {"restrictions portées": Counter(), "domaines": Counter(),
            "portées": Counter(), "expressions orphelines": Counter()}
    for lien in (RDFS.subClassOf, OWL.equivalentClass, OWL.disjointWith):
        for porteur, _, cible in g.triples((None, lien, None)):
            if isinstance(cible, BNode):
                sacs["restrictions portées"][f"{court(porteur)} {court(lien)} {expression(g, cible)}"] += 1
    for lien, nom in ((RDFS.domain, "domaines"), (RDFS.range, "portées")):
        for propriete, _, cible in g.triples((None, lien, None)):
            if isinstance(cible, BNode):
                sacs[nom][f"{court(propriete)} -> {expression(g, cible)}"] += 1
    for noeud in set(g.subjects()):
        if isinstance(noeud, BNode) and not any(True for _ in g.subjects(None, noeud)):
            sacs["expressions orphelines"][expression(g, noeud)] += 1
    return sacs

def compare(source, export, nom):
    a, b = signatures(source), signatures(export)
    print(f"--- {nom}")
    total = 0
    for categorie in a:
        manquants, ajouts = a[categorie] - b[categorie], b[categorie] - a[categorie]
        print(f"  {categorie:24} source {sum(a[categorie].values()):4}  export {sum(b[categorie].values()):4}"
              f"  absents {sum(manquants.values()):3}  ajoutés {sum(ajouts.values()):3}")
        total += sum(manquants.values())
        for s, n in sorted(manquants.items())[:10]:
            print(f"     ABSENT x{n} : {s}")
        for s, n in sorted(ajouts.items())[:10]:
            print(f"     ajouté x{n} : {s}")
    print(f"  total d'expressions absentes de l'export : {total}")

arguments = sys.argv[1:]
for i in range(0, len(arguments), 3):
    compare(arguments[i], arguments[i + 1], arguments[i + 2])
