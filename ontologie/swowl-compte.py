import sys
from rdflib import Graph, RDF, OWL, BNode

def compte(f):
    g = Graph()
    g.parse(f, format="xml")
    cls = set(g.subjects(RDF.type, OWL.Class))
    nommees = {c for c in cls if not isinstance(c, BNode)}
    ind = set()
    for s, p, o in g.triples((None, RDF.type, None)):
        if o in cls:
            ind.add(s)
    print(f"--- {f}")
    print(f"  triplets           : {len(g)}")
    print(f"  classes nommees    : {len(nommees)}")
    print(f"  proprietes objet   : {len(set(g.subjects(RDF.type, OWL.ObjectProperty)))}")
    print(f"  proprietes donnees : {len(set(g.subjects(RDF.type, OWL.DatatypeProperty)))}")
    print(f"  restrictions       : {len(set(g.subjects(RDF.type, OWL.Restriction)))}")
    print(f"  individus          : {len(ind)}")

for f in sys.argv[1:]:
    compte(f)
