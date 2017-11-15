<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.1">

	<!-- <xsl:include href="fiches.xsl"/>-->
	<!-- <xsl:include href="listes.xsl"/>-->

	<xsl:output
		method="xml"
		encoding="utf-8"
		doctype-system="master.dtd"
		indent="yes"
	/>

	<!-- NOEUD RACINE -->
	<xsl:template match="/">
		<!-- Génération Liste intervenants fichier HTML -->
		<xsl:document href="www/lecturers.html" method="xml" doctype-system="master.dtd" >
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<link rel="stylesheet" type="text/css" href="../ressources/css/style.css" />
					<title>
						Liste Intervenants
					</title>
				</head>
				<body>
					<h1>Ynov Campus :: Aix-en-Provence</h1>
					<h2>Intervenants</h2>
					<!-- intégrer Menu -->
					<div class="navigation">
						<xsl:call-template name="menu">
							<xsl:with-param name="link" >../www/</xsl:with-param>
						</xsl:call-template> 
					</div>
					<div id="contenu">
						<h3>Liste de tous les intervenants</h3>
						<ul class="liste2" id="ListeIntervenants">
							<xsl:for-each select="//lecturers/lecturer">
								<li>
									<a href="lecturers/{@id}.html">
										<xsl:value-of select="name" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</body>
			</html>
		</xsl:document>
		<!-- Generation intervenants HTML -->
		<xsl:for-each select="//lecturers/lecturer">
			<xsl:document href="www/lecturers/{@id}.html">
				<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				<html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<link rel="stylesheet" type="text/css" href="../../ressources/css/style.css" />
						<title>
							<xsl:value-of select="name" />
						</title>
					</head>
					<body>
						<xsl:call-template name="menu">
							<xsl:with-param name="link" >../</xsl:with-param>
						</xsl:call-template>
						<h1>Ynov Campus :: Aix-en-Provence</h1>
						<h2><xsl:value-of select="name" /></h2>
						<div id="contenu">
							<h3>Fiche individuelle</h3>
							<dl>
								<dt>Adresse mail</dt>
								<dd>
									<a href="mailto:{mail}">
										<xsl:value-of select="mail" />
									</a>
								</dd>
								<dt>Site web</dt>
								<dd>
									<a href="{site}">
										<xsl:value-of select="site" />
									</a>
								</dd>
								<dt>Téléphone</dt>
								<dd><xsl:value-of select="phone" /></dd>
							</dl>
							<h3>Enseignements</h3>
							<!-- A faire -->
							<!--<ul>
								<li>
									<a href="../unites/ENSMAU4.html">.NET</a>
								</li>
								<li>
									<a href="../unites/ENSMBU7.html">Web Sémantique SEOc</a>
								</li>
							</ul>-->
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>
		<!-- Generation liste programmes HTML -->
		<xsl:document href="www/program.html">
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
					<link rel="stylesheet" type="text/css" href="../ressources/css/style.css" />
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<title>
						Liste des parcours
					</title>
				</head>
				<body>
					<h1>Ynov Campus :: Aix-en-Provence</h1>
					<h3>Liste des parcours</h3>
					<xsl:call-template name="menu">
						<xsl:with-param name="link">../www/</xsl:with-param>
					</xsl:call-template>
					<ul>
						<xsl:for-each select="//program/parcour">
							<li>
								<a href="program/parcours/{@id}.html">
									<xsl:value-of select="name"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</body>
			</html>
		</xsl:document>
		
		<!-- Generation parcours HTML -->
		<xsl:for-each select="//program/parcour">
			<xsl:document href="www/program/parcours/{@id}.html">
				<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				<html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<link rel="stylesheet" type="text/css" href="../../../ressources/css/style.css" />
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<title>
							<xsl:value-of select="name" />
						</title>
					</head>
					<body>
						<h1>Ynov Campus :: Aix-en-Provence</h1>
						<h3><xsl:value-of select="name" /></h3>
						<xsl:call-template name="menu">
							<xsl:with-param name="link" >../../</xsl:with-param>
						</xsl:call-template>
						<div class="contenu">
							<h3>Présentation</h3>
							<dl>
								<dt>Responsable</dt>
								<dd>
									<ul id="responsable">
										<xsl:for-each select="/responsable">
											<li>
												<a href="{$link}/lecturers/{@ref_lecturer}.html">
													<xsl:value-of select="@ref_lecturer"/>
												</a>
											</li>
										</xsl:for-each>
									</ul>
								</dd>
								<dt>Description</dt>
								<dd>
									<xsl:value-of select="description" />
								</dd>
								<dt>Débouchés</dt>
								<!--<dd>
										<ul id="debouches">
											<li></li>
										</ul>
									</dd>-->
							</dl>
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>
		<!-- Generation Liste unites -->
		<xsl:document href="www/units.html">
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html xmlns="http://www.w3.org/1999/xhtml">
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<link rel="stylesheet" type="text/css" href="../ressources/css/style.css" />
					<title>
						Liste des unites
					</title>
				</head>
				<body>
					<h1>Ynov Campus :: Aix-en-Provence</h1>
					<h3>Liste des unites</h3>
					<xsl:call-template name="menu">
						<xsl:with-param name="link">../www/</xsl:with-param>
					</xsl:call-template>
					<ul>
						<xsl:for-each select="//unites/unite">
							<li>
								<a href="units/{@id}.html">
									<xsl:value-of select="name"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</body>
			</html>
		</xsl:document>
		
		<!-- Generation unites HTML -->
		<xsl:for-each select="//unites/unite">
			<xsl:document href="www/units/{@id}.html">
				<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				<html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<link rel="stylesheet" type="text/css" href="../../ressources/css/style.css" />
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<title>
							<xsl:value-of select="name" />
						</title>
					</head>
					<body>
						<h1>Ynov Campus :: Aix-en-Provence</h1>
						<h3><xsl:value-of select="name" /></h3>
						<xsl:call-template name="menu">
							<xsl:with-param name="link">../</xsl:with-param>
						</xsl:call-template>
						<h3>Description</h3>
						<dl>
							<dt>Code</dt>
							<dd><xsl:value-of select="@id" /></dd>
							<dt>Nombre de crédits</dt>
							<dd><xsl:value-of select="credits" /></dd>
							<dt>Lieux d'enseignement</dt>
							<xsl:for-each select="unite/place">
								<dd><xsl:value-of select="place"/></dd>
							</xsl:for-each>
							<dt>Plan</dt>
							<dd>
								<ul>
									<li>Cours: <xsl:value-of select="plan/hour_cours"/>h</li>
									<li>TD: <xsl:value-of select="plan/hour_td"/>h</li>
									<li>TP: <xsl:value-of select="plan/hour_tp"/>h</li>
								</ul>
							</dd>
							<dt>Résumé</dt>
							<dd>
								<p><xsl:value-of select="resume"/></p>
							</dd>
						</dl>
						<h3>Intervenants</h3>
						<!--<ul>
							<xsl:for-each select="//liste_ref_lecturers/ref_lecturer">
								<li>
									<a href="../lecturers/{@ref_lecturer}.html">
										<xsl:value-of select="{@ref_lecturer}"/>
									</a>
								</li>
							</xsl:for-each>
							
						</ul>-->
						<h3>Parcours</h3>
						<!--<ul>
							<li>
								<a href="../programme/parcours/M1.html">M1 INGESUP</a>
							</li>
						</ul>-->
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>
		
		<!-- Generation parcours HTML -->
		<xsl:for-each select="//program/parcour">
			<xsl:document href="www/program/parcours/{@id}.html">
				<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
				<html xmlns="http://www.w3.org/1999/xhtml">
					<head>
						<link rel="stylesheet" type="text/css" href="../../../ressources/css/style.css" />
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<title>
							<xsl:value-of select="name" />
						</title>
					</head>
					<body>
						<h1>Ynov Campus :: Aix-en-Provence</h1>
						<h3><xsl:value-of select="name" /></h3>
						<xsl:call-template name="menu">
							<xsl:with-param name="link">../../</xsl:with-param>
						</xsl:call-template>
						<div class="contenu">
							<h3>Présentation</h3>
							<dl>
								<dt>Responsable</dt>
								<dd>
									<ul id="responsable">
										<xsl:for-each select="/responsable">
											<li>
												<a href="{$link}/lecturers/{@ref_lecturer}.html">
													<xsl:value-of select="@ref_lecturer"/>
												</a>
											</li>
										</xsl:for-each>
									</ul>
								</dd>
								<dt>Description</dt>
								<dd>
									<xsl:value-of select="description" />
								</dd>
								<dt>Débouchés</dt>
								<!--<dd>
										<ul id="debouches">
											<li></li>
										</ul>
									</dd>-->
							</dl>
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>
		<!-- Squelette de l' index HTML -->
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="../ressources/css/style.css" />
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Master Ynov</title>
			</head>
			<body>
				<h1>Ynov Campus :: Aix-en-Provence</h1>
				<h2>Accueil</h2>
				<xsl:call-template name="menu">
					<xsl:with-param name="link">../www/</xsl:with-param>
				</xsl:call-template>
				<div id="contenu">
					<h3>Projet XML - Groupe 4 : Alicia Gattuso, Dylan Cocheteux, Thomas Palazetti</h3>
					<dl>
						<dt>Introduction</dt>
						<dd>Ceci est un exemple d'introduction que vous pouvez réécrire ou compléter :<br />
							Lors de la partie « XML » de l'unité d'enseignement « WEB SERVICES », nous avons réalisé ce projet. En nous basant
							sur le site WEB du Master Ynov (ingésup, lim'art ...), nous avons conçu un site WEB décrivant les unités
							d'enseignement, les enseignants, les spécialités, les parcours et les semestres du Master
							Ynov Campus.</dd>
						<dt>Contenu du rendu</dt>
						<dd>Le dossier de rendu est composé des fichiers présents dans l'arborescence dynamique ci-dessous (Il ne s'agit que d'un exemple bien évidemment) :<br /><br />
							<ul id="tree">
								<li id="c1">
									<a href="../">Projet</a>
									<ul>
										<li>
											<a href="../makefile">makefile</a>
										</li>
										<li>
											<a href="../readme.txt">readme.txt</a>
										</li>
										<li id="c2">
											<a href="../data">data</a>
											<ul>
												<li>
													<a href="../data/fiches.xsl">fiches.xsl</a>
												</li>
												<li>
													<a href="../data/listes.xsl">listes.xsl</a>
												</li>
												<li>
													<a href="../data/master.xsl">master.xsl</a>
												</li>
												<li>
													<a href="../data/master.dtd">master.dtd</a>
												</li>
												<li>
													<a href="../data/master.xml">master.xml</a>
												</li>
												<li>
													<a href="../data/master.xsd">master.xsd</a>
												</li>
												<li>
													<a href="../data/xq.txt">xq.txt</a>
												</li>
											</ul>
										</li>
										<li id="c3">
											<a href="../ressources">ressources</a>
											<ul>
												<li id="c4">
													<a href="../ressources/css">css</a>
													<ul>
														<li>
															<a href="../ressources/css/style.css">style.css</a>
														</li>
													</ul>
												</li>
												<li id="c5">
													<a href="../ressources/fonts">fonts</a>
													<ul>
														<li>
															<a href="../ressources/fonts/Timeless-Bold.ttf">Timeless-Bold.ttf</a>
														</li>
													</ul>
												</li>
												<li id="c6">
													<a href="../ressources/images">images</a>
													<ul>
														<li>
															<a href="../ressources/images/architecture.png">architecture.png</a>
														</li>
														<li>
															<a href="../ressources/images/ynov.ico">ynov.ico</a>
														</li>
														<li>
															<a href="../ressources/images/file.png">file.png</a>
														</li>
														<li>
															<a href="../ressources/images/folder.png">folder.png</a>
														</li>
														<li>
															<a href="../ressources/images/folder2.png">folder2.png</a>
														</li>
														<li>
															<a href="../ressources/images/logo-ynov.png">logo-ynov.png</a>
														</li>
													</ul>
												</li>
												<li id="c7">
													<a href="../ressources/js">js</a>
													<ul>
														<li>
															<a href="../ressources/js/fonctions.js">fonctions.js</a>
														</li>
														<li>
															<a href="../ressources/js/jquery.min.js">jquery.min.js</a>
														</li>
													</ul>
												</li>
												<li>
													<a href="../ressources/saxon9he.jar">saxon9he.jar</a>
												</li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
						</dd>
						<dt>Commandes de compilation</dt>
						<dd>Les commandes décrites ci-dessous détaillent le makefile :<br /><ul><li><b><i>make dtd :</i></b> vérifie la validité du document XML à l'aide de la DTD.</li><li><b><i>make xsd :</i></b> vérifie la validité du document XML à l'aide du Schéma.</li><li><b><i>make web :</i></b> génère le site WEB dans un répertoire qui se nomme <i>'www'</i>.</li><li><b><i>make tidy :</i></b> vérifie la validité des pages XHTML générées.</li><li><b><i>make xq :</i></b> exécute la requête XQuery du fichier <i>'xq.txt'</i> en plaçant le résultat dans le fichier <i>'xq.html'</i>.</li><li><b><i>make all :</i></b> exécute le tout dans cette ordre.</li><li><b><i>make clean :</i></b> supprime le dossier <i>'www'</i> contenant les fichiers HTML générés.</li></ul></dd>
						<dt>Travail à réaliser</dt>
						<dd>
							<dl>
								<dt>Xml</dt>
								<dd>Un fichier XML décrivant la structure du Master</dd>
								<dt>Dtd</dt>
								<dd>Une DTD associé à ce fichier XML</dd>
								<dt>Xsl</dt>
								<dd>Des feuilles de style XSL, permettant de produire le site Web du Master</dd>
								<dt>Xsd</dt>
								<dd>Un schéma pour ce fichier XML</dd>
								<dt>XQuery</dt>
								<dd>Une requête XQuery, permettant de produire une XHTML qui liste les enseignants triés par nom.</dd>
								<dt>Makefile</dt>
								<dd>Un Makefile, qui vérifie la validité du document XML à l'aide de la DTD et du Schéma.
									De plus, il génère le site WEB et vérifie la validité des page XHTML. Pour finir, il exécute la requête XQuery</dd>
								<dt>Css</dt>
								<dd>Une feuille de style permettant de mettre en forme le tout</dd>
								<dt>Javascript/JQuery</dt>
								<dd>Des fonctions permettant de trier dynamiquement les listes ainsi que d'afficher/Masquer ces dernières</dd>
							</dl>
						</dd>
						<dt>Architecture du site</dt>
						<dd>Le schéma ci-dessous décrit l'architecture du site :<br /><img src="../ressources/images/architecture.png" alt="Description de l'architecture du site" id="archi" /><dl><dt>Localisation</dt><dd>Le fichier <i>'index.html'</i> se trouve dans le dossier <i>'www'</i> généré avec le makefile. Ce dernier correspond à la page d'accueil du site.</dd><dt>Fonctionnement global</dt><dd><p>Comme on peut le voir sur l’image ci-dessus, l'ouverture du fichier 'index.html' renvoi sur la page d’accueil. Cette page détail le travail réalisé pour ce projet.
							Un menu permet au visiteur de naviguer sur le site, le menu offre cinq choix : Accueil, Programme, Unités, Intervenants, Requête XQuery.</p><p><b>Programme : </b>Affiche la liste des parcours et des spécialités du master ingésup.
								On peut cliquer sur les différents liens pour obtenir le détail des parcours et des spécialités.</p><p><b>Unités : </b>Affiche les liens de toutes les unités triées alphabétiquement. Il y a deux types de listes : la liste de toutes les unités d'enseignement (obligatoire), ainsi que des listes d'unités en fonction du nombre de crédit de ces dernières (3, 6 ... ECTS) Lorsque l’on clique sur l’un de ces liens on obtient la fiche de l'unité séléctionné. Il est également possible de faire un tri ascendant ou descenadant dynamiquement ou d'afficher/masquer les listes à l'aide de boutons.</p><p><b>Intervenants : </b>Affiche les liens de tout les intervenants triés par nom. Il y a deux types de listes : une liste qui affiche tous les intervenants ainsi qu'une seconde liste qui affiche les intervenants qui enseignent à Ynov Campus Aix-en-Provence. Lorsque l’on clique sur l’un de ces liens on obtient la fiche de l'intervenant séléctionné. De même que précedement, il est possible d'effectuer un tri dynamique et d'afficher/masquer les listes.</p><p><b>Requête XQuery : </b>Affiche le résultat de la requête XQuery.</p><p><b>Accueil : </b>Retour à la page d'accueil.</p></dd></dl></dd>
						<dt>Description de la structure du master</dt>
						<dd>
							<p>L'élément racine &lt;master&gt; est composé d'une liste d'&lt;intervenants&gt; optionnelle,
								d'une liste d'&lt;unites&gt; d'enseignement optionnelle ainsi que d'un &lt;programme&gt;
								obligatoire.</p>
							<p>Une liste d'intervenants se compose d'au moins un &lt;intervenant&gt;. Chaque intervenant est
								identifiable par son attribut 'id' et possède un &lt;nom&gt; et éventuellement une adresse
								&lt;mail&gt;, un site &lt;web&gt; et un &lt;telephone&gt;.</p>
							<p>Une liste d'unités d'enseignement se compose d'au moins une &lt;unite&gt;. Chaque unité est
								identifiable par son attribut 'id' et comprend un &lt;nom&gt;, une liste optionnelle de réferences à
								un ou plusieurs intervenants &lt;ref-intervenant&gt; identifiés par leur attribut 'id', un nombre de
								&lt;credits&gt; et éventuellement d'un &lt;resume&gt;, d'un &lt;plan&gt; comprenant un certain
								nombre d'heures de &lt;cours&gt; (plan cours), de &lt;ptd&gt; (plan td) et de &lt;ptp&gt; (plan tp) et un ou plusieurs
								&lt;lieu&gt; d'enseignement.</p>
							<p>Un programme est constitué d'au moins un &lt;parcours&gt; ou d'une &lt;specialite&gt;.</p>
							<p>Un parcours est identifiable par son attribut 'id' et comprend au moins un &lt;responsable&gt;
								identifié par son attribut 'id', un &lt;nom&gt;, une &lt;description&gt;, une liste optionnelle
								de &lt;debouche&gt; ainsi que d'au moins un &lt;semestre&gt;.</p>
							<p>Une spécialité est également identifiable par son attribut 'id' et se compose quant à elle
								d'au moins un &lt;responsable&gt;, d'un &lt;nom&gt;, d'une &lt;description&gt; et d'au moins un
								&lt;parcours&gt;.</p>
							<p>Un semestre est identifiable par son attribut 'id' et se compose d'un ou plusieurs &lt;bloc&gt;
								identifiable par un attribut 'role' (majeur, electif ...).</p>
							<p>Chaque bloc se constitue d'une liste de réferences à au moins une unité d'enseignement
								&lt;ref-unite&gt; identifié par son attribut 'id'.</p>
							<p>Les éléments &lt;nom&gt;, &lt;mail&gt;, &lt;web&gt;, &lt;cours&gt; (plan cours), &lt;ptd&gt; (plan td),
								&lt;ptp&gt; (plan tp), &lt;credits&gt;, &lt;resume&gt;, &lt;lieu&gt;, &lt;debouche&gt; et
								&lt;description&gt; sont tous composés de données textuelles.</p>
							<p>Un &lt;resume&gt; ainsi q'une &lt;description&gt; peuvent comprendre les éléments de mise
								en forme &lt;p&gt;, &lt;b&gt;, &lt;i&gt;, &lt;u&gt;, &lt;br/&gt;, &lt;a&gt;,
								&lt;ul&gt; ou &lt;ol&gt; composé de &lt;li&gt;, &lt;table&gt; composé de &lt;tr&gt;
								lui même constitué de &lt;td&gt;.</p>
						</dd>
						<dt>Conclusion</dt>
						<dd>Veuillez rédiger un bilan de cette partie. Ce qui à été réalisé et éventuellement ce qu'il reste à faire. Les difficultés rencontrées.
							Les apports de cette partie ...</dd>
					</dl>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Generation du menu -->
	<xsl:template name="menu">
		<xsl:param name="link"></xsl:param>
		<ul id="menu">
			<h3>MENU</h3>
			<li>
				<a href="{$link}index.html">
					<strong>
						Accueil
					</strong>
				</a>
			</li>
			<li>
				<a href="{$link}program.html">
					<strong>
						Programme
					</strong>
				</a>
			</li>
			<li>
				<a href="{$link}units.html">
					<strong>
						Unites
					</strong>
				</a>
			</li>
			<li>
				<a href="{$link}lecturers.html">
					<strong>
						Intervenants
					</strong>
				</a>
			</li>
			<li>
				<a href="{$link}/xq.html">
					<strong>
						Requête Xquery
					</strong>
				</a>
			</li>
		</ul>
	</xsl:template>
	<!-- NOEUD ref_lecturer -->
	<xsl:template match="ref_lecturer">
		<xsl:variable name="ref" select="@ref_lecturer" />
		<xsl:for-each select="//lecturer">
			<!-- Test condition sans XPTATH -->
			<xsl:if test="$ref = @id">
				<li>
					<a href="../lecturers/{$ref}.html">
						<xsl:value-of select="name" />
					</a>
				</li>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- FIN NOEUD ref_lecturer -->
</xsl:stylesheet>
