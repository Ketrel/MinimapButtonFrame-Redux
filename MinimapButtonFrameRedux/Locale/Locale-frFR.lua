local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "frFR")
if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
BINDING_NAME_MBF_CONFIG = "Basculer Config"
BINDING_NAME_MBF_TOGGLE = "Basculer MBF"
BINDING_NAME_MBF_ADD = "Bouton Ajouter"
BINDING_NAME_MBF_REMOVE = "Bouton Supprimer"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "Aucun nouveau message"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00Clic gauche|r  pour Cacher/Afficher l'image\n|cff1eff00Maj-cliquez|r pour montrer l'écran de configuration"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00Clic gauche|r  pour Cacher/Afficher l'image\n|cff1eff00Maj-cliquez|r pour montrer l'écran de configuration\n|cff1eff00Cliquez-droit + glisser|r pour déplacer le bouton"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Maj-cliquez|r pour montrer l'écran de configuration"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00Clic gauche + glisser |r de se déplacer MBF\n|cff1eff00Cliquez-droit|r à Masquer / Afficher l'image"

-- Error Messages
L["MBF_ERR1"] = "Erreur lors de la suppression du bouton de stockage"
L["MBF_ERR2"] = "Seuls les boutons sur la MinimapButtonFrame peuvent être retirées de celle-ci."
L["MBF_ERR3"] = "Erreur lors de la suppression invisible bouton de stock."
L["MBF_ERR4"] = "Impossible d'ajouter. Non valable un bouton ou déjà inclus!"
L["MBF_ERR5"] = "Erreur lors de la suppression des enfants Manifestations de stockage."
L["MBF_ERR6"] = "Touche pas prête à être ajoutée.  S'il vous plaît Réessayer."
L["MBF_ERR7"] = "Objet Button ou n'existe pas."

-- Chat commands
L["MBF"] = true
L["usage"] = true
L["Version"] = true
L["info"] = true
L["show"] = "montrer"
L["hide"] = "masquer"
L["reload"] = "recharger"
L["help"] = "aide"
L["debug"] = true
L["config"] = true
L["remove"] = "supprimer"
L["add"] = "ajouter"
L["MBF_SLASH_Detail1"] = "Usage /mbf [ ajouter | supprimer | info | config | montrer | masquer | recharger | aide ] "
L["MBF_SLASH_Detail2"] = "ajouter - ajoute un bouton d'auto recueillies au cadre"
L["MBF_SLASH_Detail3"] = "supprimer - supprime un bouton réunis du cadre"
L["MBF_SLASH_Detail4"] = "info - affiche des informations sur l'objet sous le curseur"
L["MBF_SLASH_Detail5"] = "config - Affiche l'écran de configuration."
L["MBF_SLASH_Detail6"] = "montrer - Montre les principaux MBF écran. "
L["MBF_SLASH_Detail7"] = "masquer - Il cache les principaux MBF écran."
L["MBF_SLASH_Detail8"] = "recharger - Réapplique la texture. Cela corrige les icônes noircies."
L["MBF_SLASH_Detail9"] = "aide - Spectacles commande aide et d'information"

-- Display Info
L["Unnamed Object"] = "Objet sans nom"
L["Unknown Object Type"] = "Inconnu type d'objet"
L["Object Type"] = "Objet Type"
L["Parent"] = true
L["Unknown Parent Name"] = "Nom du parent inconnu"
L["No Parent"] = "Aucun Parent"
L["Children"] = "Enfants"

-- Display Options
L["Display"] = "Afficher"
L["Display Settings"] = "Paramètres d'affichage"

L["Button Text"] = "Texte du bouton"
L["BUTTONTEXT_DESC"] = "Texte à afficher sur le bouton"

L["Locked"] = "Verrouillé"
L["LOCKED_DESC"] = "Passe si la MBF cadre est verrouillé."

L["Hide when Locked"] = "Masquer en position verrouillée"
L["HIDELOCKED_DESC"] = "Quelle portion de l'image doit être cachée lorsque le cadre est verrouillé."

L["ALTTITLE_DESC"] = "Autre titre Bar Lieu"
L["ALTTITLEDESC_DESC"] = "Déplacer la barre de titre vers le bas ou latéral droit plutôt que le défaut haut ou à gauche."

L["Buttonskin"] = "Bouton peau"
L["BUTTONSKIN_DESC"] = "Choisissez le bouton de la peau pour les cadres."

L["Background Color"] = "Couleur d'arrière-plan"
L["COLOR_DESC"] = "Choisit la couleur de fond de la MBF."

L["Columns or Rows"] = "Des colonnes ou des lignes"
L["CLR_DESC"] = "Le nombre de colonnes ou de lignes affichées."

L["MBF Anchor"] = true
L["MBFANCHOR_DESC"] = "Le coin que le cadre de grandir."

L["Top Left"] = "Haut gauche"
L["Top Right"] = "En haut à droite"
L["Bottom Left"] = "Gauche Bas"
L["Bottom Right"] = "En bas à droite"

L["Padding"] = "Rembourrage"
L["PADDING_DESC"] = "Combien de rembourrage entre les boutons."

L["Opacity"] = "Opacité"
L["OPACITY_DESC"] = "Définir l'opacité de l'image."

L["Scale"] = "Échelle"
L["SCALE_DESC"] = "Définir l'échelle de l'image."

L["Name"] = "Nom"
L["Nothing"] = "Rien caché"
L["Border"] = "Masquer la frontière"
L["Background"] = "Masquer Contexte"
L["All"] = "Masquer Les deux"

L["Blizzard"] = true
L["Blizzard Square"] = true

-- Gathering Options

L["Gathering"] = true
L["Gathering Settings"] = true

L["GATHERHEAD1_DESC"] = "MBF minicarte bouton Paramètres"
L["GATHERDESC1_DESC"] = "Réglages de la MBF minicarte Button"

L["Show Minimap Button"] = "Voir la mini-bouton"
L["SHOWBUTTON_DESC"] = "Afficher la MBF minicarte Button."

L["Collect Button"] = "Recueillir mini-bouton"
L["COLLECT1_DESC"] = "Rassembler la MBF minicarte Button."

L["GATHERHEAD2_DESC"] = "Blizzard minicarte bouton Paramètres"
L["GATHERDESC2_DESC"] = "Réglages de la minicarte Blizzard Boutons"

L["Collect Buttons"] = "Recueillir mini-boutons"
L["COLLECT2_DESC"] = "Rassembler le Blizzard minicarte Boutons"

L["Exclude Queue Button"] = "Exclure Bouton file d'attente"
L["ExcludeLFG_DESC"] = "Exclure la touche État file d'attente"

L["Hide Mail"] = "Masquer l'icône mail"
L["HIDEMAIL_DESC"] = "Cacher le Blizzard New Mail Icon"

L["Show No Mail Icon"] = "Afficher l'icône No Mail"
L["NOMAIL_DESC"] = "Voir le n ° Mail quand vous n'avez pas de mail."

L["Hide Tracking"] = "Masquer suivi bouton"
L["TRACKING_DESC"] = "Cacher le Blizzard Tracking Button"

L["Hide Voice Chat"] = "Masquer bouton Voice Chat"
L["VOICECHAT_DESC"] = "Cacher le Blizzard Voice Chat Button"

L["Hide Calendar"] = "Cacher l'agenda"
L["CALENDAR_DESC"] = "Cacher le Blizzard Calendar"

L["Hide Zoom Buttons"] = "Masquer mini boutons de zoom"
L["ZOOM_DESC"] = "Masquer la minicarte Blizzard Zoom Buttons"

L["Hide World Map"] = "Masquer la carte du monde bouton"
L["WORLDMAP_DESC"] = "Cacher le Blizzard World Map Button"

-- Exceptions Options

L["Exceptions"] = true
L["Exceptions Settings"] = true

L["Protected Items"] = "Documents protégés par"
L["ICONSDESC_DESC"] = "Nombre d'objets récupérés de façon incorrecte. ex .. Gatherer nœuds, éléments d'interface."

L["CURRENTEXCEPTIONS_DESC"] = "Current objets protégés."

L["Remove"] = "Supprimer"
L["ICONREMOVE_DESC"] = "Supprime l'élément sélectionné protégées."

L["ICONADDTITLE_DESC"] = "Ajouter protégées Point"
L["ICONADD_DESC"] = "Le nom généralisée de l'élément à protéger."

L["Button Override"] = "Bouton annuler"
L["OVERRIDEDESC_DESC"] = "Boutons de la MBF sont minicarte pense Icônes mais sont vraiment des boutons."

L["Current Button Overrides"] = "Current outrepassés Button"

L["OVERRIDEREMOVE_DESC"] = "Enlève le bouton sélectionné Ignorer les exceptions"

L["Add Button Override"] = "Ajouter un bouton de neutralisation"
L["OVERRIDEADD_DESC"] = "Le nom exact de la touche pour être ajouté à la table Button Override."

-- Sorting Options

L["Sorting"] = "Tri"
L["Sorting Settings"] = "Paramètres de tri"

L["Sort By Rows"] = "Trier par lignes"
L["SBR_DESC"] = "Les changements de la direction de la mini MBF sortes boutons."

L["Grow Buttons Up"] = "Boutons Grow Up"
L["GROWUP_DESC"] = "Remplit le cadre avec des boutons de bas en haut."

L["Sort Order"] = "Trier"
L["SORTORDER_DESC"] = "Choisit l'ordre de la mini-boutons sont classés"

L["Alphabetical"] = "Ordre alphabétique"
L["Blizzard First"]  = "Blizz première"
L["Blizzard Last"]  = "Blizz dernier"
L["Custom"]  = true

L["UP"] = "Vers le haut"
L["DOWN"] = "Vers le bas"
L["UP_DESC"] = "Déplacer, sélectionnez le bouton de commande du mini-up"
L["DOWN_DESC"] = "Déplacer, sélectionnez le bouton de commande du mini-down"

-- Profile Options

L["Profiles"] = "Profils"
