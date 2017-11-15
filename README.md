# XML_Groupe4
Projet XML 
==========

Groupe 4: Alicia Gattuso, Dylan Cocheteux et Thomas Palazzeti
--------

La documentation complète du projet est présente à la page d'accueil (index.html)
Le contenu complet du dossier www peut être généré automatiquement à l'aide du makefile

Contenu de l'archive:
---------------------
- README.md
- Makefile
- data/Master.xml : fichier décrivant la structure du master
- data/Master.dtd : DTD du fichier XML
- data/Master.xsd: schéma du fichier XML
- data/master.xsl : feuille de style XSL servant à la production du site Web
- xq.txt : requête XQuery
- ressources/css/style.css: feuille de style du site web
- ressources/saxon9he.jar : logiciel nécessaire à l'exécution 


Makefile
--------
Un Makefile est présent pour la gestion de l'ensemble des commandes 
- make dtd : vérifier la validité du document XML à l'aide de la DTD.
- make xsd : vérifier la validité du document XML à l'aide du Schéma.
- make web : générer le site WEB dans un répertoire qui doit se nommer www
- make tidy : vérifier la validité des pages XHTML générées avec l'aide de tidy
- make xq : exécuter la requête XQuery
- make all : execute tout dans l'ordre (sauf le clean)
- make clean: nettoyage

Sorties attendues
-----------------
- dossier Web www/*
- Rapport d'erreur

Bilan
-----
