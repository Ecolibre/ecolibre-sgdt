import sys
from rdflib import Graph, BNode, Literal, XSD

def normalise(triplet):
    """Un littéral typé xsd:string et un littéral simple sont la même chose en RDF 1.1."""
    sujet, predicat, objet = triplet
    if isinstance(objet, Literal) and objet.datatype == XSD.string:
        objet = Literal(str(objet))
    return (sujet, predicat, objet)

def controle(source, export):
    a = Graph(); a.parse(source, format="xml")
    b = Graph(); b.parse(export, format="xml")
    concrets = {normalise(t) for t in a
                if not isinstance(t[0], BNode) and not isinstance(t[2], BNode)}
    presents = {normalise(t) for t in b}
    manquants = concrets - presents
    print(f"--- {source}")
    print(f"  triplets source                : {len(a)}")
    print(f"  triplets export                : {len(b)}")
    print(f"  triplets concrets a retrouver  : {len(concrets)}")
    print(f"  ABSENTS DE L'EXPORT            : {len(manquants)}")
    court = lambda x: str(x).rsplit("#", 1)[-1] if "#" in str(x) else str(x)
    for s, p, o in sorted(manquants, key=str)[:20]:
        print(f"     manque : {court(s)} | {court(p)} | {court(o)}")
    if len(manquants) > 20:
        print(f"     ... et {len(manquants) - 20} autres")

arguments = sys.argv[1:]
for i in range(0, len(arguments), 2):
    controle(arguments[i], arguments[i + 1])
