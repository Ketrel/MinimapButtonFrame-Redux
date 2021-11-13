local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "enUS", true)

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
BINDING_NAME_MBF_CONFIG = "Toggle Config"
BINDING_NAME_MBF_TOGGLE = "Toggle MBF"
BINDING_NAME_MBF_ADD = "Add Button"
BINDING_NAME_MBF_REMOVE = "Remove Button"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = true
L["MBF_LDB_TOOLTIP"] = "|cff1eff00Left-Click|r to Hide/Show the frame\n|cff1eff00Shift-click|r to show the config screen"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00Left-Click|r to Hide/Show the frame\n|cff1eff00Shift-click|r to show the config screen\n|cff1eff00Right-click + drag|r to move the button"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift-click|r to show the config screen"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00Left-Click + drag|r to move MBF\n|cff1eff00Right-click|r to Hide/Show the frame"

-- Error Messages
L["MBF_ERR1"] = "Error Removing Button from Storage"
L["MBF_ERR2"] = "Only buttons on the MinimapButtonFrame can be removed from it."
L["MBF_ERR3"] = "Error Removing Invisible Button from Storage."
L["MBF_ERR4"] = "Cannot add.  Protected or already included!"
L["MBF_ERR5"] = "Error Removing Child Events from storage."
L["MBF_ERR6"] = "Button not ready to be added.  Please Retry."
L["MBF_ERR7"] = "Button or Object does not exist."

-- Chat commands
L["MBF"] = true
L["usage"] = true
L["Version"] = true
L["info"] = true
L["show"] = true
L["hide"] = true
L["reload"] = true
L["help"] = true
L["debug"] = true
L["config"] = true
L["remove"] = true
L["add"] = true
L["MBF_SLASH_Detail1"] = "Usage /mbf [ add | remove | info | config | show | hide | reload | help ] "
L["MBF_SLASH_Detail2"] = "add - adds a non auto gathered button to the frame"
L["MBF_SLASH_Detail3"] = "remove - removes a gathered button from the frame"
L["MBF_SLASH_Detail4"] = "info - Shows information about the object under the cursor"
L["MBF_SLASH_Detail5"] = "config - Shows the configuration screen."
L["MBF_SLASH_Detail6"] = "show - Shows the main MBF screen."
L["MBF_SLASH_Detail7"] = "hide - Hides the main MBF screen."
L["MBF_SLASH_Detail8"] = "reload - Re-applies the texture.  This fixes the blackend icons."
L["MBF_SLASH_Detail9"] = "help - Shows command help and information"

-- Display Info
L["Unnamed Object"] = true
L["Unknown Object Type"] = true
L["Object Type"] = true
L["Parent"] = true
L["Unknown Parent Name"] = true
L["No Parent"] = true
L["Children"] = true

-- Display Options
L["Display"] = true
L["Display Settings"] = true

L["Button Text"] = true 
L["BUTTONTEXT_DESC"] = "Text to show on button"

L["Locked"] = true
L["LOCKED_DESC"] = "Toggles whether the MBF frame is locked."

L["dragLocked"] = "Lock Dragging"
L["DRAGLOCKED_DESC="] = "Prevent the button and frame from being moved."

L["Hide when Locked"] = true
L["HIDELOCKED_DESC"] = "What portion of the frame should be hidden when the frame is locked."

L["ALTTITLE_DESC"] = "Alt Title Bar Location"
L["ALTTITLEDESC_DESC"] = "Move the title bar to the Bottom or Right Side rather than the default Top or Left Side."

L["Buttonskin"] = true
L["BUTTONSKIN_DESC"] = "Choose the skin for the button frames."

L["Background Color"] = true
L["COLOR_DESC"] = "Chooses the background color for MBF."

L["Columns or Rows"] = true
L["CLR_DESC"] = "The number of columns or rows displayed."

L["MBF Anchor"] = true
L["MBFANCHOR_DESC"] = "The corner of the MBF window that the frame will grow from."

L["Top Left"] = true
L["Top Right"] = true
L["Bottom Left"] = true
L["Bottom Right"] = true

L["Padding"] = true
L["PADDING_DESC"] = "How much padding between the buttons."

L["Opacity"] = true
L["OPACITY_DESC"] = "Set the opacity of the frame."

L["Scale"] = true
L["SCALE_DESC"] = "Set the scale of the frame."

L["Name"] = true
L["Nothing"] = true
L["Border"] = true
L["Background"] = true
L["All"] = true

L["Blizzard"] = true
L["Blizzard Square"] = true

-- Gathering Options

L["Gathering"] = true
L["Gathering Settings"] = true

L["GATHERHEAD1_DESC"] = "MBF Minimap Button Settings"
L["GATHERDESC1_DESC"] = "Settings for the MBF Minimap Button"

L["Show Minimap Button"] = true
L["SHOWBUTTON_DESC"] = "Show the MBF Minimap Button."

L["Collect Button"] = true
L["COLLECT1_DESC"] = "Collect the MBF Minimap Button."

L["GATHERHEAD2_DESC"] = "Blizzard Minimap Button Settings"
L["GATHERDESC2_DESC"] = "Settings for the Blizzard Minimap Buttons"

L["Collect Buttons"] = true
L["COLLECT2_DESC"] = "Collect the Blizzard Minimap Buttons"

L["Exclude Queue Button"] = true
L["ExcludeLFG_DESC"] = "Exclude the Queue Status Button"

L["Hide Mail"] = true
L["HIDEMAIL_DESC"] = "Hide the Blizzard New Mail Icon"

L["Show No Mail Icon"] = true
L["NOMAIL_DESC"] = "Show the No Mail Icon when you don't have mail."

L["Hide Tracking"] = true
L["TRACKING_DESC"] = "Hide the Blizzard Tracking Button"

L["Hide Voice Chat"] = true
L["VOICECHAT_DESC"] = "Hide the Blizzard Voice Chat Button"

L["Hide Calendar"] = true
L["CALENDAR_DESC"] = "Hide the Blizzard Calendar Icon"

L["Hide Zoom Buttons"] = true
L["ZOOM_DESC"] = "Hide the Blizzard Minimap Zoom Buttons"

L["Hide World Map"] = true
L["WORLDMAP_DESC"] = "Hide the Blizzard World Map Button"

-- Exceptions Options

L["Exceptions"] = true
L["Exceptions Settings"] = true

L["Protected Items"] = true
L["ICONSDESC_DESC"] = "Incorrectly collected items.  ex..Gatherer Nodes, UI Items."

L["CURRENTEXCEPTIONS_DESC"] = "Current Protected Items exceptions"

L["Remove"] = true
L["ICONREMOVE_DESC"] = "Removes the selected Protected Item from the exceptions"

L["ICONADDTITLE_DESC"] = "Add Protected Item"
L["ICONADD_DESC"] = "The generalized name of the Item to be protected."

L["Button Override"] = true
L["OVERRIDEDESC_DESC"] = "Buttons the MBF thinks are Minimap Icons but are really buttons."

L["Current Button Overrides"] = true

L["OVERRIDEREMOVE_DESC"] = "Removes the selected Button Override from the exceptions"

L["Add Button Override"] = true
L["OVERRIDEADD_DESC"] = "The exact name of the button to be added to the Button Override table."

-- Sorting Options

L["Sorting"] = true
L["Sorting Settings"] = true

L["Sort By Rows"] = true
L["SBR_DESC"] = "Changes the direction MBF sorts the minimap buttons."

L["Grow Buttons Up"] = true
L["GROWUP_DESC"] = "Fills the frame with buttons from the bottom up."

L["Sort Order"] = true
L["SORTORDER_DESC"] = "Chooses the order that the minimap buttons are sorted"

L["Alphabetical"] = true
L["Blizzard First"]  = true
L["Blizzard Last"]  = true
L["Custom"]  = true

L["UP"] = true
L["DOWN"] = true
L["UP_DESC"] = "Move the selected minimap button's order up"
L["DOWN_DESC"] = "Move the selected minimap button's order down"

-- Profile Options

L["Profiles"] = true
