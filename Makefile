XSLT = xsltproc
LINT = xmllint --noout

#Nettoyage
clean:
	rm -R www tidy_out.txt traceDTD.txt traceXSD.txt
	@echo "-----[ CLEAN OK ]-----"

#Vérifier la validité du document XML à l'aide de la DTD. (avec xmllint)
dtd:
	@echo "\nValidation de la DTD"
	$(LINT) --valid data/Master.xml > traceDTD.txt
	@echo "-----[ DTD OK ]-----"

#Vérifier la validité du document XML à l'aide du Schéma.(avec xmllint)
xsd :
	@echo "\nValidation du schema"
	$(LINT) -valid -schema data/Master.xsd data/Master.xml > traceXSD.txt
	@echo "-----[ XSD OK ]-----"

#Génération du dossier web www/
mkdir_web:
	mkdir -p www
	@echo "-----[ MKDIR WWW OK ]-----"

#Générer le site WEB dans un répertoire qui doit se nommer www
#(une page www/index.html est obligatoire).(avec xsltproc)
web :
	@echo "\nGénération du dossier www/"
	$(XSLT) data/Master.xsl data/Master.xml > www/index.html
	@echo "-----[ WEB OK ]-----"

#Vérifier la validité des pages XHTML générées avec l'aide de tidy
#(bien entendu, toutes vos pages doivent être valides).
tidy : 
	tidy -utf8 --error-file tidy_out.txt -i -m www/*.html
	@echo "-----[ TIDY OK ]-----"

#Exécuter la requête XQuery (qui doit se trouver dans le fichier xq.txt) en placant le résultat dans le fichier xq.html
#(n'oubliez pas d'embarquer dans votre rendu le logiciel nécessaire à cette exécution).
#(java -cp ressources/saxon9he.jar net.sf.saxon.Query cheminVers/xq.txt CheminVers/xq.html)
xq:
	@echo "\nCréation de la requête XQuery"
	java -cp ressources/saxon9he.jar net.sf.saxon.Query !indent=yes xq.txt > www/xq.html
	
#Execute tout dans l'ordre
all : dtd xsd mkdir_web web xq tidy

