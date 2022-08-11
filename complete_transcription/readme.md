# complete_transcription usage
Le présent fichier détaille la manière dont a été constitué le texte encodé en XML-tei pour le projet RePPOL. Pour fonctionner tous les scripts doivent être réunis dans le même dossier avec l'ensemble des transcriptions téléchargé sur [TACT] (https://tact.demarre-shs.fr/project/31/transcription/541).
## Step 1
Le script "\_1_texte_complet.pl" opère la fusion de l'ensemble des fichiers de transcription (page 001 à 360) en un seul. Il ajoute également les éléments \<facsimile> de 001 à 360 munis de leurs attributs référants aux fichiers [IIIF](https://iiif.io/) du [MS128](https://parker.stanford.edu/parker/catalog/ps908cx9813)
Ce script traite l'ensemble des transcriptions par une boucle "for" ouvrant un fichier à la fois, pour les fichiers dont les noms comprennent une lettre : 166a 166b 166c 166d 264a 265a 324a 325a, il faut interrompre la boucle, traiter ces fichiers un à un (ainsi que le fichier précédent) puis relancer la boucle for.
Au passage ce script ajoute un marqueur en commentaire "\<!---->" du début et de la fin de chacune des pages, pour s'y retrouver et permettre les traitements ultérieurs.
On obtient 
"\_textecomplet.xml"
## Step 2
Le script "\_2_textecomplet_nettoyage.pl" nettoie les éléments parasites, créé les \<expan> pose les balises \<add>, \<del> et \<unclear> avec leurs attributs (sans valeur).
On obtient
"\_textecomplet_nettoye.xml"
## Step 3
La pose automatique de balises se fait via plusieurs scripts qui doivent être utilisé les uns après les autres dans un ordre précis.
### Step 3.1
Le script "\_3_textecomplet_collections.pl" repère les mentions de début de page et de fin de page nécessaire pour poser les grands éléments de structure, les div de type collection.
On obtient 
"\_textecomplet_collections.xml"
### Step 3.2
Le script "\_3_textecomplet_sections.pl" repère les débuts et les fins de section (début/fin de page ou titre dans le texte pour les pages 009 à 095) et pose les div de type article, memorandum, question_set, answer_set, deposition, testimony, index.
On obtient
"\_textecomplet_collections_sections.xml"
### Step 3.3
Le script "\_3_comptage_n_numeros_page.pl" pose les balises \<pb>, leurs attributs et les attributs "@n" des \<div> posées au préalable. Ce script ajoute également l'ensemble du \<teiheader> aux transcriptions.
On obtient
"\_textecomplet_collections_sections_n.xml"
## Step 4
La trasnformation xsl "\_restructuration_page_v2.xsl" permet de restructurer le texte en page tout en conservant les sections et sous-sections parfois à cheval sur plusieurs pages en les liant par un jeu d'attribut. Elle s'applique au fichier "\_textecomplet_collections_sections_n.xml".
On obtient un fichier dont l'utilisateur est libre de choisir le nom. La version distribuée ici est appelée "\_textecomplet_collections_sections_n_pages.xml"
## Step 5 
Encodage à la main, commencé le 27 juillet 2022 d'où le nom du fichier : "\_reppol_transcription_20220727.xml"
