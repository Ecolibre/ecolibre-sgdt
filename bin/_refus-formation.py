#!/usr/bin/env python3
# Pourquoi ce script existe (lot 48, 19 novembre 2026) : les espaces de
# formation (CAO, SolidWorks, FreeCAD, Onshape, Fusion, numéros 502 à 511,
# et 512 à 515 réservés pour Inventor et Catia) sont verrouillés au groupe
# formation, dont le robot de ce dépôt hérite. Or ce dépôt est public, et ses
# rapports aussi : rien de ces espaces ne doit y entrer. Les scripts de bin/
# appellent ce détecteur avant tout appel réseau et s'arrêtent s'il refuse.
# Aucune exception, aucune variable pour lever le refus : le travail sur ces
# espaces se fait dans le dépôt privé formation-cao.
# Depuis la suite de la tâche 3, le mode paramètres refuse aussi le JSON de
# smwbrowse qui vise ces espaces, et toute page visée par son numéro
# (pageids, revids, oldid…), que le contrôle par nom ne peut pas voir.
#
# Usage (helper interne, lancé par python3 -I) :
#   _refus-formation.py --titre "T1" ["T2|T3" ...]
#   _refus-formation.py --params "action=...&..."
# Code 0 et rien à l'écran si rien n'est visé ; code 1 et une ligne ERREUR
# sur la sortie d'erreur sinon ; code 2 sur un usage incorrect (les scripts
# appelants traitent tout code non nul comme un refus).
import re
import sys
from urllib.parse import unquote_plus

NOMS = r"(?:cao|solidworks|freecad|onshape|fusion|inventor|catia)"
TITRE_RE = re.compile(r"^(?:discussion +)?" + NOMS + r" *:", re.IGNORECASE)
DANS_VALEUR_RE = re.compile(r"(?:^|[\[|:= \"{,])" + NOMS + r" *:", re.IGNORECASE)
NS_JSON_RE = re.compile(r"\bns\"? *: *\"?(?:50[2-9]|51[0-5])(?!\d)")
NUMEROS = {str(n) for n in range(502, 516)}
PAR_NUMERO = {"pageids", "pageid", "revids", "oldid", "fromid", "toid",
              "fromrev", "torev"}


def normaliser(titre, decoder=True):
    if decoder:
        titre = unquote_plus(titre)
    return titre.replace("_", " ").lstrip(": ")


def titre_refuse(titre, decoder=True):
    return bool(TITRE_RE.match(normaliser(titre, decoder)))


def refuser(valeur):
    sys.stderr.write("ERREUR: refus - '" + valeur + "' vise un espace de "
                     "formation, réservé au dépôt formation-cao.\n")
    sys.exit(1)


def mode_titre(args):
    for arg in args:
        for titre in arg.split("|"):
            if titre_refuse(titre):
                refuser(titre)


def mode_params(chaine):
    for paire in chaine.split("&"):
        nom, _, valeur = paire.partition("=")
        nom = unquote_plus(nom)
        valeur = unquote_plus(valeur)
        if nom in PAR_NUMERO:
            sys.stderr.write("ERREUR: refus - '" + nom + "' vise une page par "
                             "son numéro, ce qui échappe au contrôle des "
                             "espaces de formation.\n")
            sys.exit(1)
        if NS_JSON_RE.search(valeur):
            refuser(valeur)
        for morceau in valeur.split("|"):
            if titre_refuse(morceau, decoder=False):
                refuser(morceau)
        if DANS_VALEUR_RE.search(valeur.replace("_", " ")):
            refuser(valeur)
        if nom == "ns" or nom.endswith("namespace"):
            for morceau in valeur.split("|"):
                if morceau.strip() in NUMEROS or morceau.strip() == "*":
                    refuser(nom + "=" + valeur)


def main(argv):
    if len(argv) >= 2 and argv[0] == "--titre":
        mode_titre(argv[1:])
    elif len(argv) == 2 and argv[0] == "--params":
        mode_params(argv[1])
    else:
        sys.stderr.write("Usage: _refus-formation.py --titre \"T1\" [...] | "
                         "--params \"action=...\"\n")
        sys.exit(2)
    sys.exit(0)


if __name__ == "__main__":
    main(sys.argv[1:])
