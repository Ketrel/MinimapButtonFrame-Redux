local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "deDE")
if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
BINDING_NAME_MBF_CONFIG = "Konfigurationsfenster anzeigen/verstecken"
BINDING_NAME_MBF_TOGGLE = "MBF anzeigen/verstecken"
BINDING_NAME_MBF_ADD = "Button hinzufügen";
BINDING_NAME_MBF_REMOVE = "Button entfernen";

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "Keine neue Post"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00Links-Klicken|r um den MBF anzuzeigen/auszublenden\n|cff1eff00Shift-Klick|r um das Konfigurationsfenster anzuzeigen/auszublenden"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00Links-Klicken|r um den MBF anzuzeigen/auszublenden\n|cff1eff00Shift-Klick|r um das Konfigurationsfenster anzuzeigen/auszublenden\n|cff1eff00Recht-Klicken + Ziehen|r um einen Button zu bewegen"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift-Klick|r Konfigurationsfenster öffnen"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00Links-Klicken + Drag|r MBF bewegen\n|cff1eff00Recht-Klicken|r MBF anzeigen/ausblenden"

-- Error Messages
L["MBF_ERR1"] = "Fehler beim Entfernen von Buttons"
L["MBF_ERR2"] = "Es können nur Buttons aus dem Minimap Button Frame entfernt werden."
L["MBF_ERR3"] = "Fehler beim Entfernen von unsichtbaren Buttons."
L["MBF_ERR4"] = "Kann nicht hinzugefügt werden. Geschützt oder bereits enthalten!"
L["MBF_ERR5"] = "Fehler beim Entfernen von Child-Events."
L["MBF_ERR6"] = "Button nicht bereit, hinzugefügt werden.  Bitte Wiederholen."
L["MBF_ERR7"] = "Button oder Objekt ist nicht vorhanden."

-- Chat commands
L["MBF"] = true
L["usage"] = true
L["Version"] = true
L["info"] = "infos"
L["show"] = "zeigen"
L["hide"] = "verstecken"
L["reload"] = "neuladen"
L["help"] = "hilfe"
L["debug"] = true
L["config"] = "konfiguration"
L["remove"] = "entfernen"
L["add"] = "hinzufügen"
L["MBF_SLASH_Detail1"] = "Usage /mbf [ hinzufügen | entfernen | infos | konfiguration | zeigen | verstecken | neuladen | hilfe ] "
L["MBF_SLASH_Detail2"] = "hinzufügen - einen nicht automatisch eingesammelten Button dem MBF hinzufügen"
L["MBF_SLASH_Detail3"] = "entfernen - entfernt einen Button aus dem MBF"
L["MBF_SLASH_Detail4"] = "infos - zeigt Informationen über das Objekt unter dem Mauscursor"
L["MBF_SLASH_Detail5"] = "konfiguration - zeigt das Konfigurationsfenster"
L["MBF_SLASH_Detail6"] = "zeigen - zeigt den MBF an"
L["MBF_SLASH_Detail7"] = "verstecken - blendet den MBF aus"
L["MBF_SLASH_Detail8"] = "neuladen - Wendet die Textur erneut an. Dadurch werden die geschwärzten Symbole korrigiert."
L["MBF_SLASH_Detail9"] = "hilfe - zeigt Informationen und Hilfe zu Befehlen an"

-- Display Info
L["Unnamed Object"] = "Unbenanntes Objekt"
L["Unknown Object Type"] = "Unbekannter Objekttyp"
L["Object Type"] = "Objekttyp"
L["Parent"] = true
L["Unknown Parent Name"] = "Unbekanner Parent Name"
L["No Parent"] = "Kein Parent vorhanden"
L["Children"] = "Kinder"

-- Display Options
L["Display"] = "Anzeige"
L["Display Settings"] = true

L["Button Text"] = "Schaltflächentext"
L["BUTTONTEXT_DESC"] = "Text, um auf der Schaltfläche anzuzeigen"

L["Locked"] = "Gesperrt"
L["LOCKED_DESC"] = "Wechselt, ob die MBF Rahmen ist gesperrt."

L["dragLocked"] = "Bewegungsschloss"
L["DRAGLOCKED_DESC="] = "Verhindern, dass der Knopf und der Rahmen verschoben werden soll."

L["Hide when Locked"] = "Ausblenden wenn gesperrt"
L["HIDELOCKED_DESC"] = "Was Teil des Rahmens sollte nicht angezeigt, wenn der Rahmen ist gesperrt."

L["ALTTITLE_DESC"] = "Alternative Titel Bar Lage"
L["ALTTITLEDESC_DESC"] = "Bewegen Sie die Titelleiste an der Unterseite oder auf der rechten Seite und nicht die Standard-Top oder linken Seite."

L["Buttonskin"] = true
L["BUTTONSKIN_DESC"] = "Wählen Sie die Haut für die Schaltflächen-Frames."

L["Background Color"] = "Hintergrundfarbe"
L["COLOR_DESC"] = "Wählt die Hintergrundfarbe für MBF."

L["Columns or Rows"] = "Spalten oder Zeilen"
L["CLR_DESC"] = "Die Zahl der colomns oder Zeilen angezeigt."

L["MBF Anchor"] = true
L["MBFANCHOR_DESC"] = "Die Ecke, dass der Rahmen wird aus wachsen."

L["Top Left"] = "Oben links"
L["Top Right"] = "Rechts oben"
L["Bottom Left"] = "Unten links"
L["Bottom Right"] = "Unten rechts"

L["Padding"] = "Abstand"
L["PADDING_DESC"] = "Wie viel Polsterung zwischen den Tasten."

L["Opacity"] = "Opazität"
L["OPACITY_DESC"] = "Stellen Sie die Deckkraft des Rahmens."

L["Scale"] = "Maßstab"
L["SCALE_DESC"] = "Stellen Sie den Umfang des Rahmens."

L["Name"] = true
L["Nothing"] = "Alles anzeigen"
L["Border"] = "Rahmen ausblenden"
L["Background"] = "Hintergrund ausblenden"
L["All"] = "Beides ausblenden"

L["Blizzard"] = true
L["Blizzard Square"] = "Blizzard Quadrat"

-- Gathering Options

L["Gathering"] = true
L["Gathering Settings"] = "Gathering Einstellungen"

L["GATHERHEAD1_DESC"] = "MBF Minimap Button Einstellungen"
L["GATHERDESC1_DESC"] = "Einstellungen für die MBF Minimap Button"

L["Show Minimap Button"] = "Zeige Minimap button"
L["SHOWBUTTON_DESC"] = "Lassen Sie sich die MBF Minimap Button."

L["Collect Button"] = "Sammeln Sie Button"
L["COLLECT1_DESC"] = "Sammeln Sie die MBF Minimap Button."

L["GATHERHEAD2_DESC"] = "Blizzard Minimap Button Settings"
L["GATHERDESC2_DESC"] = "Settings for the Blizzard Minimap Buttons"

L["Exclude Queue Button"] = "Ausschließen Queue Button"
L["ExcludeLFG_DESC"] = "Schließen Sie den Queue-Status Button"

L["Collect Buttons"] = "Sammeln Sie Buttons"
L["COLLECT2_DESC"] = "Sammeln Sie die Blizzard Minimap Buttons"

L["Hide Mail"] = "Post-Symbol ausblenden"
L["HIDEMAIL_DESC"] = "Hide the Blizzard New Mail Icon"

L["Show No Mail Icon"] = "Post-Symbol deaktivieren"
L["NOMAIL_DESC"] = "Show the No Mail Icon when you don't have mail."

L["Hide Tracking"] = "Tracking-Button ausblenden"
L["TRACKING_DESC"] = "Hide the Blizzard Tracking Button"

L["Hide Voice Chat"] = "VoiceChat-Button ausblenden"
L["VOICECHAT_DESC"] = "Hide the Blizzard Voice Chat Button"

L["Hide Calendar"] = "Kalender ausblenden"
L["CALENDAR_DESC"] = "Hide the Blizzard Game Time Icon"

L["Hide Zoom Buttons"] = "Minikarten-Zoom-Tasten ausblenden"
L["ZOOM_DESC"] = "Hide the Blizzard Minimap Zoom Buttons"

L["Hide World Map"] = "Weltkarten-Button ausblenden"
L["WORLDMAP_DESC"] = "Hide the Blizzard World Map Button"

-- Exceptions Options

L["Exceptions"] = "Ausnahmen"
L["Exceptions Settings"] = "Ausnahmen Einstellungen"

L["Protected Items"] = "Beschermde Objecten"
L["ICONSDESC_DESC"] = "Onjuist verzamelde items. ex .. Gatherer nodes, UI items."

L["CURRENTEXCEPTIONS_DESC"] = "Beschermde Current Items."

L["Remove"] = "Entfernen"
L["ICONREMOVE_DESC"] = "Verwijdert de geselecteerde Beschermde Item."

L["ICONADDTITLE_DESC"] = "Voeg Beschermde Post "
L["ICONADD_DESC"] = "De algemene naam van het item te worden beschermd."

L["Button Override"] = true
L["OVERRIDEDESC_DESC"] = "Buttons die MBF denkt sind Minimap Icons sind aber wirklich Tasten."

L["Current Button Overrides"] = "Aktuelle Button Überschreibt"

L["OVERRIDEREMOVE_DESC"] = "Entfernt die ausgewählten Button Override der Ausnahmen"

L["Add Button Override"] = "Schaltfläche Hinzufügen überschreiben"
L["OVERRIDEADD_DESC"] = "Die genauen Namen der Schaltfläche, um die auf den Button Override Tabelle."

-- Sorting Options

L["Sorting"] = true
L["Sorting Settings"] = true

L["Sort By Rows"] = "Nach Zeilen sortieren"
L["SBR_DESC"] = "Ändert die Richtung MBF Art der Minikarte Tasten."

L["Grow Buttons Up"] = true
L["GROWUP_DESC"] = "Füllt den Rahmen mit Tasten von unten nach oben."

L["Sort Order"] = "Sortierreihenfolge"
L["SORTORDER_DESC"] = "Entscheidet die Reihenfolge, dass die Minimap Buttons sind sortiert"

L["Alphabetical"] = "Alphabetisch"
L["Blizzard First"]  = "Blizz Buttons zuerst"
L["Blizzard Last"]  = "Blizz Buttons zuletzt"
L["Custom"]  = "Brauch"

L["UP"] = "Nach oben"
L["DOWN"] = "Abwärts"
L["UP_DESC"] = "Bewegen Sie den ausgewählten Minikarte Schaltfläche, um sich"
L["DOWN_DESC"] = "Bewegen Sie den ausgewählten Minikarte Taste, um nach unten"

-- Profile Options

L["Profiles"] = true
