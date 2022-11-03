MBFversion = GetAddOnMetadata("MinimapButtonFrame", "Version");
--MBF_DRAGTITLE = "MBF " .. MBFversion;
MBF_DRAGTITLE = "MBF"

local LibStub = LibStub
	  bachMBF = LibStub("AceAddon-3.0"):NewAddon("Minimap Button Frame", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Minimap Button Frame")
local libdbicon = LibStub("LibDBIcon-1.0", true)


-- Internal Variables
local scanned = false;
local MBF_ButtonInfoStorage = {};
local MBF_ChildEventStorage = {};
local tBackdrop = {};
local tBorder = {};
local tList = {};
local tSize = {};
local currentProfile;
local numButtons = 2;

local oldParentName;
local oldPoint;
local oldRelativeTo;
local oldRelativePoint;
local oldXofs;
local oldYofs;
local oldOnEvent;
local oldOnDragStart;
local oldOnDragStop;
local oldName;
local oldFrameLevel;
local oldWidth;
local oldHeight;
local oldScale;
local oldLevel;
local oldStrata;


local BlizzButtons = { "MiniMapTracking", "MiniMapWorldMapButton", "QueueStatusMinimapButton", "MinimapZoomIn", "MinimapZoomOut", "MiniMapMailFrame", "MiniMapBattlefieldFrame", "GameTimeFrame", "FeedbackUIButton" };
local BlizzUI = { "ActionBar", "BonusActionButton", "MainMenu", "ShapeshiftButton", "MultiBar", "KeyRingButton", "PlayerFrame", "TargetFrame", "PartyMemberFrame", "ChatFrame", "ExhaustionTick", "TargetofTargetFrame", "WorldFrame", "ActionButton", "CharacterMicroButton", "SpellbookMicroButton", "TalentMicroButton", "QuestLogMicroButton", "SocialsMicroButton", "LFGMicroButton", "HelpMicroButton", "CharacterBag", "PetFrame",  "MinimapCluster", "MinimapBackdrop", "UIParent", "WorldFrame", "Minimap", "BuffButton", "BuffFrame", "TimeManagerClockButton", "CharacterFrame" };
local BlizzParentStop = { "WorldFrame", "Minimap", "MinimapBackdrop", "UIParent", "MinimapCluster" }
local SkinProtect = { "MinimapButtonFrameDragButton", "MBFRestoreButton", "GameTimeFrame" }

-- Configuration Screens

local hidewhenlocked_options = {
	["Nothing"]	= L["Nothing"],
	["Border"]	= L["Border"],
	["Background"]	= L["Background"],
	["All"]	= L["All"],
}

local sortorder_options = {
	["Alphabetical"]	= L["Alphabetical"],
	["Blizzard First"]	= L["Blizzard First"],
	["Blizzard Last"]	= L["Blizzard Last"],
	["Custom"]		= L["Custom"],
}

local frameanchor_options = {
	["TOPLEFT"]	= L["Top Left"],
	["TOPRIGHT"]	= L["Top Right"],
	["BOTTOMRIGHT"]	= L["Bottom Right"],
	["BOTTOMLEFT"]  = L["Bottom Left"],
}

local minimapIconList = {};
local buttonOverrideList = {};
local childList = {};

local display = {
	order = 1,
	type = "group",
	name = L["Display"],
	desc = L["Display Settings"],
	handler = MBF,
	args = {		
        buttonText = {
            order   = 1,
            type    = "input",
            name    = L["Button Text"],
            desc    = L["BUTTONTEXT_DESC"],
            get     = function() return bachMBF.db.profile.buttonText or "-- MBF --" end,
            set     = function (info, v) bachMBF.db.profile.buttonText = v
                        MBFRestoreButton:SetText(" "..v.." ")
                        MinimapButtonFrameDragButton:SetText(" "..v.." ")
                      end,
        },
        space = {
            order   = 2,
            name    = "\n",
            type    = "description",
        },
		hidewhenlocked = {
			order	= 3,
			type	= "select",
			name	= L["Hide when Locked"],
			desc	= L["HIDELOCKED_DESC"],
			get	= function() return bachMBF.db.profile.colorLocked end,
			set	= function(info,name) bachMBF.db.profile.colorLocked = name 
					MBFC_ColorLocked()
				end,
			values	= hidewhenlocked_options,
		},
		locked = {
			order	= 4,
			type	= "toggle",
			name	= L["Locked"],
			desc	= L["LOCKED_DESC"],
			get	= function() return bachMBF.db.profile.locked end,
			set	= function() bachMBF.db.profile.locked = not bachMBF.db.profile.locked 
					--if not bachMBF.db.profile.locked and not bachMBF.db.profile.mbfHidden then
                    if not bachMBF.db.profile.locked then
						MinimapButtonFrameDragButton:Show()
						MBFRestoreButtonFrame:Show()
					else
						MinimapButtonFrameDragButton:Hide()
						MBFRestoreButtonFrame:Hide()
					end	
					MBFC_ColorLocked()
				end,
		},
        dragLocked = {
            order   = 5,
            type    = "toggle",
            name    = L["dragLocked"],
            desc    = L["DRAGLOCKED_DESC"],
            get     = function () return bachMBF.db.profile.dragLocked end,
            set     = function () bachMBF.db.profile.dragLocked = not bachMBF.db.profile.dragLocked end,
        },
		altTitle = {
			order	= 6,
			type	= "toggle",
			name	= L["ALTTITLE_DESC"],
			desc	= L["ALTTITLEDESC_DESC"],
			get	= function() return bachMBF.db.profile.altTitle end,
			set	= function() bachMBF.db.profile.altTitle = not bachMBF.db.profile.altTitle
					bachMBF:SwapTitleLocation()
				end,
		},
		space1 = {
			order	= 7,
			name	= "\n",
			type	= "description",
		},
		backgroundcolor = {
			order	= 10,
			type	= 'color',
			name	= L['Background Color'],
			desc	= L['COLOR_DESC'],
			hasAlpha = true,
			get	= function() 
					local t = bachMBF.db.profile.MBFBackdropColor 
					return t.Red, t.Green, t.Blue, t.Alpha 
				end,
			set	= function(info, r, g, b, a)
					local t = bachMBF.db.profile.MBFBackdropColor
					t.Red = r
					t.Green = g
					t.Blue = b
					t.Alpha = a
					MBFC_ColorLocked()
				end,
		},
		space1 = {
			order	= 11,
			name	= "",
			type	= "description",
		},
		opacity = {
			order	= 20,
			type	= "range",
			name	= L["Opacity"],
			desc	= L["OPACITY_DESC"],
			min	= 0,
			max	= 1,
			step	= .1,
			get	= function() return bachMBF.db.profile.opacity end,
			set	= function(info, v) bachMBF.db.profile.opacity = v 
					MinimapButtonFrame:SetAlpha(bachMBF.db.profile.opacity)
					MBFRestoreButtonFrame:SetAlpha(bachMBF.db.profile.opacity)
				end,
		},
		space2 = {
			order	= 21,
			name	= "",
			type	= "description",
		},
		columnsorrows = {
			order	= 30,
			type	= "range",
			name	= L["Columns or Rows"],
			desc	= L["CLR_DESC"],
			min	= 1,
			max	= 50,
			step	= 1,
			get	= function() return bachMBF.db.profile.columns_or_rows end,
			set	= function(info, v) bachMBF.db.profile.columns_or_rows = v 
					bachMBF:Scan()
				end,
		},
		mbfanchor = {
			order	= 31,
			type	= "select",
			name	= L["MBF Anchor"],
			desc	= L["MBFANCHOR_DESC"],
			get	= function() return bachMBF.db.profile.mbfAnchor end,
			set	= function(info,name) bachMBF.db.profile.mbfAnchor = name 
					bachMBF:SavePosition();
				end,
			values	= frameanchor_options,
		},
		space3 = {
			order	= 32,
			name	= "",
			type	= "description",
		},
		padding = {
			order	= 40,
			type	= "range",
			name	= L["Padding"],
			desc	= L["PADDING_DESC"],
			min	= 0,
			max	= 20,
			step	= .5,
			get	= function() return bachMBF.db.profile.padding end,
			set	= function(info, v) bachMBF.db.profile.padding = v 
					bachMBF:Scan()
				end,
		},
		space4 = {
			order	= 41,
			name	= "",
			type	= "description",
		},
		scale = {
			order	= 50,
			type	= "range",
			name	= L["Scale"],
			desc	= L["SCALE_DESC"],
			min	= .5,
			max	= 2,
			step	= .1,
			get	= function() return bachMBF.db.profile.addonScale end,
			set	= function(info, v) bachMBF.db.profile.addonScale = v 
					MinimapButtonFrame:SetScale(bachMBF.db.profile.addonScale)
					MBFRestoreButtonFrame:SetScale(bachMBF.db.profile.addonScale)
				end,
		},
		space5 = {
			order	= 51,
			name	= "",
			type	= "description",
		},
		buttonskin = {
			order	= 60,
			type	= "select",
			name	= L["Buttonskin"],
			desc	= L["BUTTONSKIN_DESC"],
			get	= function() return bachMBF.db.profile.currentTexture end,
			set	= function(info,name) bachMBF.db.profile.currentTexture = name 
					textureFrame(MinimapButtonFrame)
					bachMBF:Scan()
				end,
			values	= tList,
		},
	},
}

local funcBack = {
    minimapZoomInShow   = Minimap.ZoomIn.Show,
    minimapZoomOutShow  = Minimap.ZoomOut.Show,
    }

local gathering = {
	order = 2,
	type = "group",
	name = L["Gathering"],
	desc = L["Gathering Settings"],
	handler = MBF,
	args = {		
		header1 = {
			order	= 1,
			type	= "header",
			name	= L["GATHERHEAD1_DESC"],
		},
		desc1 = {
			order	= 2,
			type	= "description",
			name	= L["GATHERDESC1_DESC"] .. "\n",
		},
		ShowMinimapButton = {
			order	= 3,
			type	= "toggle",
			name	= L["Show Minimap Button"],
			desc	= L["SHOWBUTTON_DESC"],
			get	= function() return not bachMBF.db.profile.minimapButton.hide end,
			set	= function(_,v) bachMBF.db.profile.minimapButton.hide = not(v)
					if bachMBF.db.profile.minimapButton.hide then
						libdbicon:Hide("MBF")
					else
						libdbicon:Show("MBF")
					end
					bachMBF:Scan()
				end,
			disabled = function() if libdbicon then return false end return true end,
		},
		GatherMBFButton = {
			order	= 4,
			type	= "toggle",
			name	= L["Collect Button"],
			desc	= L["COLLECT1_DESC"],
			get	= function() return bachMBF.db.profile.grabMBFButton end,
			set	= function(info, value) bachMBF.db.profile.grabMBFButton = not bachMBF.db.profile.grabMBFButton 
					if (bachMBF.db.profile.grabMBFButton) then
						MinimapButtonFrame:Show();
						bachMBF.db.profile.mbfHidden = false;
					else
						removeButton(LibDBIcon10_MBF, 0);
					end
					bachMBF:Scan()
				end,
			disabled = function() if bachMBF.db.profile.minimapButton.hide then return true end return false end,
		},
		spacer0 = {
			order	= 5,
			name	= "\n",
			type	= "description",
		},
		header2 = {
			order	= 10,
			type	= "header",
			name	= L["GATHERHEAD2_DESC"],
		},
		desc2 = {
			order	= 11,
			type	= "description",
			name	= L["GATHERDESC2_DESC"] .. "\n",
		},
		GatherBlizz = {
			order	= 12,
			type	= "toggle",
			name	= L["Collect Buttons"],
			desc	= L["COLLECT2_DESC"],
			get	= function() return bachMBF.db.profile.grabBlizzButtons end,
			set	= function(info, value) bachMBF.db.profile.grabBlizzButtons = not bachMBF.db.profile.grabBlizzButtons 
					if not (bachMBF.db.profile.grabBlizzButtons) then
						removeBlizzButtons()
						bachMBF.db.profile.disabledMail = false
					end
					bachMBF:Scan()
				end,
		},
		ExcludeQueue = {
			order	= 13,
			type	= "toggle",
			name	= L["Exclude Queue Button"],
			desc	= L["ExcludeLFG_DESC"],
			get	= function() return bachMBF.db.profile.excludeLFG end,
			set	= function(info, value) bachMBF.db.profile.excludeLFG = not bachMBF.db.profile.excludeLFG
					if (bachMBF.db.profile.excludeLFG) then
						if not(isInTable(bachMBF.db.profile.MBF_Ignore, "QueueStatusMinimapButton")) then
							tinsert(bachMBF.db.profile.MBF_Ignore, "QueueStatusMinimapButton")
							for i, miniButton in ipairs({MinimapButtonFrame:GetChildren()}) do
								if (miniButton:GetName() == "QueueStatusMinimapButton") then
									removeButton(miniButton, 0)
								end
							end
						end
					else
						if (isInTable(bachMBF.db.profile.MBF_Ignore, "QueueStatusMinimapButton")) then
							removeFromTable(bachMBF.db.profile.MBF_Ignore, "QueueStatusMinimapButton")
						end
					end
					bachMBF:Scan()
				end,
			disabled = function() if bachMBF.db.profile.grabBlizzButtons then return false end return true end,
		},		
		spacer1 = {
			order	= 15,
			name	= "",
			type	= "description",
		},
		HideBlizzMail = {
			order	= 16,
			type	= "toggle",
			name	= L["Hide Mail"],
			desc	= L["HIDEMAIL_DESC"],
			get	= function() return bachMBF.db.profile.MBFHideMiniMapMailFrame end,
			set	= function(info, value) bachMBF.db.profile.MBFHideMiniMapMailFrame = not bachMBF.db.profile.MBFHideMiniMapMailFrame 
					if bachMBF.db.profile.MBFHideMiniMapMailFrame then
						MiniMapMailFrame:Hide()
						bachMBF.db.profile.disabledMail = false
					else
						if (HasNewMail()) then
							MiniMapMailFrame:Show()
						end
					end
					bachMBF:Scan()
				end,
		},
		ShowNoMail = {
			order	= 17,
			type	= "toggle",
			name	= L["Show No Mail Icon"],
			desc	= L["NOMAIL_DESC"],
			get	= function() return bachMBF.db.profile.disabledMail end,
			set	= function(info, value) bachMBF.db.profile.disabledMail = not bachMBF.db.profile.disabledMail 
					bachMBF:Scan()
				end,
			disabled = function() if bachMBF.db.profile.MBFHideMiniMapMailFrame or (bachMBF.db.profile.grabBlizzButtons == false) then return true end return false end,
		},
		spacer2 = {
			order	= 19,
			name	= "",
			type	= "description",
		},
		HideTracking = {
			order	= 20,
			type	= "toggle",
			name	= L["Hide Tracking"],
			desc	= L["TRACKING_DESC"],
			get	= function() return bachMBF.db.profile.MBFHideMiniMapTracking end,
			set	= function(info, value) bachMBF.db.profile.MBFHideMiniMapTracking = not bachMBF.db.profile.MBFHideMiniMapTracking 
					if bachMBF.db.profile.MBFHideMiniMapTracking then
						MiniMapTracking:Hide()
					else
						MiniMapTracking:Show()
					end
					bachMBF:Scan()
				end,
		},
		spacer4 = {
			order	= 25,
			name	= "",
			type	= "description",
		},
		HideGameTime = {
			order	= 31,
			type	= "toggle",
			name	= L["Hide Calendar"],
			desc	= L["CALENDAR_DESC"],
			get	= function() return bachMBF.db.profile.MBFHideGameTimeFrame end,
			set	= function(info, value) bachMBF.db.profile.MBFHideGameTimeFrame = not bachMBF.db.profile.MBFHideGameTimeFrame 
					if bachMBF.db.profile.MBFHideGameTimeFrame then
						GameTimeFrame:Hide()
					else
						GameTimeFrame:Show()
					end
					bachMBF:Scan()
				end,
		},
		spacer5 = {
			order	= 35,
			name	= "",
			type	= "description",
		},
		HideMinimapZoom = {
			order	= 36,
			type	= "toggle",
			name	= L["Hide Zoom Buttons"],
			desc	= L["ZOOM_DESC"],
			get	= function() return bachMBF.db.profile.MBFHideMinimapZoomIn end,
			set	= function(info, value) bachMBF.db.profile.MBFHideMinimapZoomIn = not bachMBF.db.profile.MBFHideMinimapZoomIn 
					if bachMBF.db.profile.MBFHideMinimapZoomIn then
						Minimap.ZoomIn:Hide()
						Minimap.ZoomOut:Hide()
                        Minimap.ZoomIn.Show = function() end
                        Minimap.ZoomOut.Show = function() end
					else
                        Minimap.ZoomIn.Show = funcBack["minimapZoomInShow"]
                        Minimap.ZoomOut.Show = funcBack["minimapZoomOutShow"]
						Minimap.ZoomIn:Show()
						Minimap.ZoomOut:Show()
					end
					bachMBF:Scan()
				end,
		},
		spacer6 = {
			order	= 40,
			name	= "",
			type	= "description",
		},
		HideWorldMap = {
			order	= 41,
			type	= "toggle",
			name	= L["Hide World Map"],
			desc	= L["WORLDMAP_DESC"],
			get	= function() return bachMBF.db.profile.MBFHideMiniMapWorldMapButton end,
			set	= function(info, value) bachMBF.db.profile.MBFHideMiniMapWorldMapButton = not bachMBF.db.profile.MBFHideMiniMapWorldMapButton 
					if bachMBF.db.profile.MBFHideMiniMapWorldMapButton then
						MiniMapWorldMapButton:Hide()
					else
						MiniMapWorldMapButton:Show()
					end
					bachMBF:Scan()
				end,
		},
	},
}

local exceptions = {
	order = 1,
	type = "group",
	name = L["Exceptions"],
	desc = L["Exceptions Settings"],
	handler = MBF,
	args = {		
		header1 = {
			order	= 1,
			type	= "header",
			name	= L["Protected Items"],
		},
		desc1 = {
			order	= 2,
			type	= "description",
			name	= L["ICONSDESC_DESC"] .. "\n",
		},
		minimapIcons = {
			order	= 3,
			type	= "select",
			name	= L["Protected Items"],
			desc	= L["CURRENTEXCEPTIONS_DESC"],
			get	= function() return bachMBF.db.profile.currentMinimapIcon end,
			set	= function(info,name) bachMBF.db.profile.currentMinimapIcon = name end,
			values	= minimapIconList,
		},
		removeIcon = {
			order	= 4, 
			type	= "execute",
			name	= L["Remove"],
			desc	= L["ICONREMOVE_DESC"],
			func	= function() 
					local miniButton = bachMBF.db.profile.currentMinimapIcon
					removeFromTable(bachMBF.db.profile.MinimapIcons, miniButton)
					minimapIconList[miniButton] = nil;
					for i, name in pairs(bachMBF.db.profile.MinimapIcons) do
						minimapIconList[name] = name
						if i == 1 then 
							bachMBF.db.profile.currentMinimapIcon = name
						end
					end
					bachMBF:Scan()
				end,
		},
		spacer1 = {
			order	= 5,
			name	= "\n",
			type	= "description",
		},
		iconInput = {
			order	= 6,		
			type	= "input",
			name	= L["ICONADDTITLE_DESC"],
			desc	= L["ICONADD_DESC"],
			set	= function(info, newValue)
					local liveButton
					tinsert(bachMBF.db.profile.MinimapIcons, newValue)
					minimapIconList[newValue] = newValue
					for i, liveButton in ipairs({MinimapButtonFrame:GetChildren()}) do
						if (isMinimapIcon(liveButton:GetName())) then	
							removeButton(liveButton, 1)
						end
					end
					bachMBF:Scan()
				end,
		},
		header2 = {
			order	= 10,
			type	= "header",
			name	= L["Button Override"],
		},
		desc2 = {
			order	= 11,
			type	= "description",
			name	= L["OVERRIDEDESC_DESC"] .. "\n",
		},
		buttonOverride = {
			order	= 12,
			type	= "select",
			name	= L["Button Override"],
			desc	= L["Current Button Overrides"],
			get	= function() return bachMBF.db.profile.currentButtonOverride end,
			set	= function(info,name) bachMBF.db.profile.currentButtonOverride = name end,
			values	= buttonOverrideList,
		},
		removeOverride = {
			order	= 13, 
			type	= "execute",
			name	= L["Remove"],
			desc	= L["OVERRIDEREMOVE_DESC"],
			func	= function() 
					local liveButton
					local miniButton = bachMBF.db.profile.currentButtonOverride
					if isInTable(bachMBF.db.profile.ButtonOverride, miniButton) then
						removeFromTable(bachMBF.db.profile.ButtonOverride, miniButton)
						liveButton = _G[miniButton]
						if ((liveButton ~= nil) and (MBF_ButtonInfoStorage[miniButton] ~= nil)) then
							removeButton(liveButton, 0)
						end
						for i, name in pairs(bachMBF.db.profile.ButtonOverride) do
							buttonOverrideList[name] = name
							if i == 1 then 
								bachMBF.db.profile.currentButtonOverride = name
							end
						end
						buttonOverrideList[miniButton] = nil;
						bachMBF:Scan()
					end
				end,
		},
		spacer2 = {
			order	= 14,
			name	= "\n",
			type	= "description",
		},
		overrideInput = {
			order	= 15,
			type	= "input",
			name	= L["Add Button Override"],
			desc	= L["OVERRIDEADD_DESC"],
			set	= function(info, newValue)
					tinsert(bachMBF.db.profile.ButtonOverride, newValue)
					buttonOverrideList[newValue] = newValue
					bachMBF:Scan()
				end,
		},
	},
}

local sorting = {
	order = 1,
	type = "group",
	name = L["Sorting"],
	desc = L["Sorting Settings"],
	handler = MBF,
	args = {
		sortOrder = {
			order	= 1,
			type	= "select",
			name	= L["Sort Order"],
			desc	= L["SORTORDER_DESC"],
			get	= function() return bachMBF.db.profile.sortOrder end,
			set	= function(info,name) bachMBF.db.profile.sortOrder = name 
					bachMBF:Scan()
				end,
			values	= sortorder_options,
		},
		growUp = {
			order	= 2,
			type	= "toggle",
			name	= L["Grow Buttons Up"],
			desc	= L["GROWUP_DESC"],
			get	= function() return bachMBF.db.profile.GrowUp end,
			set	= function(info, value) bachMBF.db.profile.GrowUp = not bachMBF.db.profile.GrowUp
					bachMBF:Scan()
				end,
		},
		 sortByRows = {
			order	= 3,
			type	= "toggle",
			name	= L["Sort By Rows"],
			desc	= L["SBR_DESC"],
			get	= function() return bachMBF.db.profile.sort_by_rows end,
			set	= function(info, value) bachMBF.db.profile.sort_by_rows = not bachMBF.db.profile.sort_by_rows 
					bachMBF:Scan()
				end,
		},
		space = {
			order	= 9,
			name	= "\n",
			type	= "description",
		},
		mbfKids = {
			order	= 10,
			type	= "select",
			name	= L["Children"],
			desc	= L["Children"],
			get	= function() return bachMBF.db.profile.currentChild end,
			set	= function(info,name) bachMBF.db.profile.currentChild = name end,
			values	= childList,
		},
		moveUp = {
			order	= 11, 
			type	= "execute",
			name	= L["UP"],
			image	= "Interface/Buttons/UI-ScrollBar-ScrollUpButton-Up",
			imageWidth = 50,
			imageHeight = 50,
			desc	= L["UP_DESC"],
			func	= function() bachMBF:moveButton(1) end,
		},
		moveDown = {
			order	= 12, 
			type	= "execute",
			name	= L["DOWN"],
			image	= "Interface/Buttons/UI-ScrollBar-ScrollDownButton-Up",
			imageWidth = 50,
			imageHeight = 50,
			desc	= L["DOWN_DESC"],
			func	= function() bachMBF:moveButton(2) end,
		},
	}
}

local defaults = {
	profile = {
		version = MBFVersion,
		-- Display Vars
		locked = false,
		colorLocked = "Nothing",
		altTitle = false,
		mbfAnchor = "TOPRIGHT",
		currentTexture = "Blizzard",
		MBFBackdropColor = { Red = 0, Green = 0, Blue = 0, Alpha = 1 },
		columns_or_rows = 3,
		sort_by_rows = false,
		padding = 5,
		opacity = 1,
		addonScale = .8,
		MBF_FrameLocation = { "TOPRIGHT", "TOPRIGHT", 0, 0 },
		mbfHidden = false,
		rollUp = false,
		-- Gathering Vars
		minimapButton = { hide = true },
		grabMBFButton = false,
		grabBlizzButtons = false,
		disabledMail = true,
		MBFHideMiniMapMailFrame = false,
		MBFHideMiniMapTracking = false,
		MBFHideGameTimeFrame = false,
		MBFHideMinimapZoomIn  = false,
		MBFHideMiniMapWorldMapButton = false,
		MBFHideMiniMapLFGFrame = false,
		MBFHideMiniMapBattlefieldFrame = false,
		-- Exception Vars
		currentMinimapIcon = "Note",
		MinimapIcons = { "Note", "JQuest", "NauticusMiniIcon", "MinimapIcon", "GatherMatePin", "WestPointer", "Chinchilla_", "SmartMinimapZoom", "pMinimap", "GuildMap3Mini", "MiniButton", "DropCount", "ZGVMarker", "QuestGiversPin", "ArchyMinimapPOI", "ArchyBlobMinimap", "BreadCrumbsPoints"  },
		currentButtonOverride = "notesiconframe",
		ButtonOverride = { "notesiconframe", "duckiebank_minimapicon", "cta_minimapicon", "BejeweledMinimapIcon", "EMPMINIMAPBUTTON", "MobMapMinimapButtonFrame", "Karma_MinimapIconFrame", "FuBarPluginCraftNotesFrameMinimapButton", "PeggledMinimapIcon", "DropCount_MinimapIcon", "LibDBIcon10_CrossRealmAssistMinimapIcon" },
		UserUIProtected = { "TitanPanel", "AutoBarButton", "FuBarFrame", "RicoMinimap_CoordinatesFrame", "MinimapZoom", "MinimapButtonFrame", "Xparky", "MBFRestoreButton", "BasicMiniMap", "CT_RASetsFrame", "SMM", "GuildOrg_Toggle", "ElvuiMinimap", "ElvUI_ConsolidatedBuffs", "ElvConfigToggle", "TTMinimapButton" },
		ParentStop = { "CECBMiniMapButtonFrame", "CT_RASetsFrame", "GuildOrg_Toggle", "PoisonerStateHeader" },
		MBF_Ignore = { "MetamapButton" },
		MBF_Include = { },
		-- Sorting Vars
		sortOrder = "Alphabetical",
		growUp = false,
		currentChild = "",
		customChildren = {},
	}
}


-- Init and Event Handler Functions

function bachMBF:OnInitialize()
    -- Called when the addon is loaded
	self.db = LibStub("AceDB-3.0"):New("MBFDB", defaults, true)

	if LibStub:GetLibrary("LibAboutPanel", true) then
		self.optionsFrame = LibStub:GetLibrary("LibAboutPanel").new(nil, "Minimap Button Frame")
	else
		self:Print("Lib AboutPanel not loaded.")
	end

	LibStub("AceConfig-3.0"):RegisterOptionsTable("MBF Display", display)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("MBF Gathering", gathering)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("MBF Exceptions", exceptions)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("MBF Sorting", sorting)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("MBF Profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db))
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MBF Display", L["Display"], "MinimapButtonFrame")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MBF Gathering", L["Gathering"], "MinimapButtonFrame")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MBF Exceptions", L["Exceptions"], "MinimapButtonFrame")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MBF Sorting", L["Sorting"], "MinimapButtonFrame")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MBF Profiles", L["Profiles"], "MinimapButtonFrame")

	self:RegisterChatCommand(L["MBF"], "ChatCommand")

	self:fillDropdowns();

	MBFC_LoadStandardSkins();

	bachMBF.obj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("MinimapButtonFrame", {
		type = "launcher",
		text = "MBF",
		OnClick = function(_, msg, down)
			if (IsShiftKeyDown()) then						
				MBFC_Toggle();
			elseif ( msg == "LeftButton" ) then
                MBFC_Visible(2, MinimapButtonFrame:GetParent():GetName());
			end
		end,
		icon = "Interface\\Icons\\INV_Misc_Coin_11",
		OnTooltipShow = function(tooltip)
			if not tooltip or not tooltip.AddLine then return end
			tooltip:AddLine(L["ADDON"]);
			tooltip:AddLine(L["MBF_LDB_TOOLTIP"])
		end,
	})

	-- register MBF with LibDBicon and show minimap icon
	if libdbicon then
		libdbicon:Register("MBF", bachMBF.obj, bachMBF.db.profile.minimapButton)
	end

	self:Init();

    MinimapButtonFrame:RegisterForDrag("LeftButton");
	MinimapButtonFrameDragButton:RegisterForClicks("RightButtonUp");
	MBFRestoreButton:RegisterForClicks("RightButtonUp");

	self:ScheduleRepeatingTimer("Scan", 5)
end

function bachMBF:Init()
	currentProfile = self.db:GetCurrentProfile();
	
	setMBFLocation();
	
	if (((bachMBF.db.profile.disabledMail == true) and (HasNewMail() == false)) and (((bachMBF.db.profile.grabBlizzButtons == true) and (isInTable(bachMBF.db.profile.MBF_Ignore,"MiniMapMailFrame") == false)) or ((bachMBF.db.profile.grabBlizzButtons == false) and (isInTable(bachMBF.db.profile.MBF_Include,"MiniMapMailFrame") == true)))) then
		MiniMapMailFrameDisabled:Show();
		MiniMapMailFrameDisabled:SetFrameLevel(MinimapButtonFrame:GetFrameLevel()+1)
	end

	if (bachMBF.db.profile.locked) then
		MinimapButtonFrameDragButton:Hide();
		MBFRestoreButtonFrame:Hide();
	end

	self:SwapTitleLocation()

	MBFRestoreButtonFrame:SetAlpha(bachMBF.db.profile.opacity);
	MBFRestoreButtonFrame:SetScale(bachMBF.db.profile.addonScale);
	
	MinimapButtonFrame:SetAlpha(bachMBF.db.profile.opacity);
	MinimapButtonFrame:SetScale(bachMBF.db.profile.addonScale);
	MBFC_ColorLocked();

	if bachMBF.db.profile.mbfHidden then
		MinimapButtonFrame:Hide();
		MBFRestoreButtonFrame:Hide();
	end
	if bachMBF.db.profile.rollUp then
		MBFRestoreButton:Show();
		MBFRestoreButtonFrame:Show();
	end


	if libdbicon then
		if bachMBF.db.profile.minimapButton.hide then
			libdbicon:Hide("MBF")
		else
			libdbicon:Show("MBF")
		end
	end
	numButtons = MinimapButtonFrame:GetNumChildren();
end

function bachMBF:ChatCommand(input)
	if not input or input:trim() == "" then
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	else
		--local startPos, endPos, firstWord, restOfString = strfind(input, "(%w+)[%s%p]*(.*)");
		local startPos, endPos, firstWord, restOfString = strfind(input, "([^%s]+)[%s%p]*(.*)");
		firstWord = strlower(firstWord)

		if (firstWord == L["usage"]) then
			self:Print(L["Version"] .. " " .. MBFversion);
			self:Print(L["MBF_SLASH_Detail1"]);
		end
		if (firstWord == L["info"]) then
			displayInfo(GetMouseFocus());
		end 
		if (firstWord == L["show"]) then
			MBFC_Visible(3);
		end
		if (firstWord == L["hide"]) then
			MBFC_Visible(4);
		end
        if (firstWord == L["reload"]) then
            textureFrame(MinimapButtonFrame);
            --bachMBF:Scan(); 
		end 
		if (firstWord == L["help"]) then
			self:Print(L["MBF_SLASH_Detail1"]);
			self:Print(L["MBF_SLASH_Detail2"]);
			self:Print(L["MBF_SLASH_Detail3"]);
			self:Print(L["MBF_SLASH_Detail4"]);
			self:Print(L["MBF_SLASH_Detail5"]);
			self:Print(L["MBF_SLASH_Detail6"]);
			self:Print(L["MBF_SLASH_Detail7"]);
			self:Print(L["MBF_SLASH_Detail8"]);
			self:Print(L["MBF_SLASH_Detail9"]);
		end
		if (firstWord == L["config"]) then
			MBFC_Toggle();
		end
		if (firstWord == L["remove"]) then
			if (restOfString == "") then
				if (GetMouseFocus():GetName() ~= "WorldFrame") then
					removeButton(GetMouseFocus(), 0)
				end
			else
				if (restOfString ~= "WorldFrame") then
					local miniButton = _G[restOfString];
					if (miniButton ~= nil) then
						removeButton(miniButton, 0)
					else
						self:Print(L["MBF_ERR7"]);
					end
				end
			end
		end
		if (firstWord == L["add"]) then
			if (restOfString == "") then 
				includeButton(GetMouseFocus());
			else
				local miniButton = _G[restOfString];
				if (miniButton ~= nil) then
					includeButton(miniButton)
				else
					self:Print(L["MBF_ERR7"]);
				end
			end
		end
	end
end

function displayInfo(target)
	bachMBF:Print("----------------------------------------------------------");
	bachMBF:Print("----------------------------------------------------------");
	bachMBF:Print(format(target:GetName() or '(' .. L["Unnamed Object"] .. ')'));
	bachMBF:Print("----------------------------------------------------------");
	if (target:GetName() ~= "WorldFrame") then
		bachMBF:Print(L["Parent"] .. " : " .. format(target:GetParent():GetName() or '(' .. L["Unknown Parent Name"] .. ')'));
	else
		bachMBF:Print(L["Parent"] .. " : " .. L["No Parent"]);
	end 
	bachMBF:Print(L["Object Type"] .. " : " .. format(target:GetObjectType() or '(' .. L["Unknown Object Type"] .. ')'));
	bachMBF:Print("----------------------------------------------------------");
	bachMBF:Print("Textures");
	bachMBF:Print("----------------------------------------------------------");
	for _, r in pairs({target:GetRegions()}) do
		if r:GetObjectType() == "Texture" then
			rName = r:GetName();
			rTex = r:GetTexture();
			rDL = r:GetDrawLayer();
			bachMBF:Print("Texture Name : " .. format(rName or "nil"));
			bachMBF:Print("Texture Path : " .. format(rTex or "nil"));
			bachMBF:Print("Draw Layer   : " .. format(rDL or "nil"));
			bachMBF:Print("----------------------------------------------------------");
		end
	end
	bachMBF:Print("----------------------------------------------------------");
	bachMBF:Print("Size");
	bachMBF:Print("----------------------------------------------------------");
	bachMBF:Print("Width : " .. target:GetWidth());
	bachMBF:Print("Height : " .. target:GetHeight());
end

function bachMBF:OnDragStart()
	if (bachMBF.db.profile.locked == false and not bachMBF.db.profile.dragLocked) then
		MinimapButtonFrame:StartMoving();
		MinimapButtonFrame.isMoving = true;
	end
end

function bachMBF:OnDragStop()
	if (bachMBF.db.profile.locked == false and not bachMBF.db.profile.dragLocked) then
		MinimapButtonFrame:StopMovingOrSizing();
		MinimapButtonFrame.isMoving = false;
		MinimapButtonFrame:SetUserPlaced(false);
		MinimapButtonFrame:SetFrameLevel(2);
		
		bachMBF:SavePosition();
	end
end 

function bachMBF:SavePosition()

	local bPoint;
	local bRelativeTo;
	local bRelativePoint;
	local bXofs;
	local bYofs;
	local width;
	local height;

	bPoint, bRelativeTo, bRelativePoint, bXofs, bYofs = MinimapButtonFrame:GetPoint();

	if bachMBF.db.profile.mbfAnchor == bPoint then
		bachMBF.db.profile.MBF_FrameLocation = { bPoint, bRelativePoint, bXofs, bYofs }
	else
		width = MinimapButtonFrame:GetWidth();
		height = MinimapButtonFrame:GetHeight();

		if bPoint == "TOP" then
			bXofs = bXofs - (width / 2)
		elseif bPoint == "LEFT" then
			bYofs = bYofs + (height / 2)
		elseif bPoint == "BOTTOMLEFT" then
			bYofs = bYofs + height
		elseif bPoint == "TOPRIGHT" then
			bXofs = bXofs - width
		elseif bPoint == "RIGHT" then
			bYofs = bYofs + (height / 2)
			bXofs = bXofs - width
		elseif bPoint == "BOTTOM" then
			bYofs = bYofs + height
			bXofs = bXofs - (width / 2)
		elseif bPoint == "BOTTOMRIGHT" then
			bYofs = bYofs + height
			bXofs = bXofs - width
		elseif bPoint == "CENTER" then
			bYofs = bYofs + (height / 2)
			bXofs = bXofs - (width / 2)
		end
	
		if bachMBF.db.profile.mbfAnchor == "TOPRIGHT"then
			bXofs = bXofs + width
		elseif bachMBF.db.profile.mbfAnchor == "BOTTOMRIGHT" then
			bYofs = bYofs - height
			bXofs = bXofs + width
		elseif bachMBF.db.profile.mbfAnchor == "BOTTOMLEFT" then
			bYofs = bYofs - height
		end

		bachMBF.db.profile.MBF_FrameLocation = { bachMBF.db.profile.mbfAnchor, bRelativePoint, bXofs, bYofs }
	end

	setMBFLocation();
end

-- Utility Functions


function CloneTable(t)			--Code by Grayhoof (SCT)
	local new = {};
	local i, v = next(t, nil);
	while i do
		if type(v)=="table" then
			v=CloneTable(v);
		end
		new[i] = v;
		i, v = next(t, i);
	end
	return new;
end

function setMBFLocation()
	local bPoint;
	local bRelativePoint;
	local bXofs;
	local bYofs;

	if not MinimapButtonFrame.isMoving then

		bPoint, bRelativePoint, bXofs, bYofs = unpack(bachMBF.db.profile.MBF_FrameLocation);

		MinimapButtonFrame:ClearAllPoints();
		MinimapButtonFrame:SetPoint(bPoint, UIParent, bRelativePoint, bXofs, bYofs);
		MinimapButtonFrame:SetFrameLevel(2);
		MinimapButtonFrame:SetUserPlaced(false);
	end
end

isInTable = function(tab, frameName)
	for k,v in ipairs(tab) do
		if (strlower(v) == strlower(frameName)) then
			return true;
		end
	end
	return false;
end

isPartialMatch = function(frameName, tab)
	local result = false

	for k,v in ipairs(tab) do
		startpos, endpos = strfind(strlower(frameName), strlower(v))
		if (startpos == 1) then
			result = true;
		end
	end

	return result;
end

isBlizzButton = function(frameName)
	return isInTable(BlizzButtons, frameName);
end

getTopParent = function(frame) 
-- returns 1 for ParentStop parent, and 0 for MBF
	local result;
	local parentName = frame:GetParent():GetName();

	if (isInTable(bachMBF.db.profile.ParentStop,parentName) or isInTable(BlizzParentStop,parentName)) then 
		result = 1
	elseif (parentName == "MinimapButtonFrame") then
		result = 0
	else
		result = getTopParent(frame:GetParent());
	end
	
	return result;
end

isMinimapIcon = function(frame)
	local foundPos = 0;
	local frameName = strlower(frame);
	local result = false;
	local k, v;

	for k,v in ipairs(bachMBF.db.profile.MinimapIcons) do
		foundPos = strfind(frameName,strlower(v),1);
		
		if (foundPos) then
			if not isInTable(bachMBF.db.profile.ButtonOverride, frameName) then
				result = true;
			end
		end
	end
	return result;
end

isValidAdd = function(frame, autoGather)
	local result = true;
	local frameName = frame:GetName();

	if (frameName ~= nil) then
		if (frame:IsShown()) then
			if (getTopParent(frame) == 1) then
				if (isPartialMatch(frameName, BlizzUI) or isPartialMatch(frameName,bachMBF.db.profile.UserUIProtected)) then
					result = false;
				end

				if (isMinimapIcon(frameName)) then
					result = false;
				end

				if (frameName == "LibDBIcon10_MBF") then
					if (bachMBF.db.profile.grabMBFButton == false) then
						result = false;
					else
						result = true;
					end
				end 

				if (frameName == "GuildOrgButtonFrame") then
					result = false;
				end

				if (autoGather) then
					if (isBlizzButton(frameName)) then
						if (bachMBF.db.profile.grabBlizzButtons == true) then
							result = true;
						else
							result = false;
						end
					end
					if (isInTable(bachMBF.db.profile.MBF_Ignore,frameName)) then
						result = false;
					end
				else
					if (isBlizzButton(frameName)) then
						if ((bachMBF.db.profile.grabBlizzButtons == true) and (isInTable(bachMBF.db.profile.MBF_Ignore,frameName))) then
							result = true;
						elseif (bachMBF.db.profile.grabBlizzButtons == false) then
							result = true;
						end
					end
				end
			else
				result = false;
			end
		elseif (frameName == "MiniMapMailFrame") then
			if ((bachMBF.db.profile.disabledMail == false) or (bachMBF.db.profile.MBFHideMiniMapMailFrame == true) or ((bachMBF.db.profile.grabBlizzButtons == false) and (isInTable(bachMBF.db.profile.MBF_Include, frameName) == false)) or ((bachMBF.db.profile.grabBlizzButtons == true) and (isInTable(bachMBF.db.profile.MBF_Ignore, frameName) == true))) then
				result = false;
			end
		else
			result = false;
		end
	else
		result = false;
	end
	return result

end

isButtonFrame = function(frame)
	return (frame:GetObjectType() == ("Frame"))
end

function removeFromTable(tab, buttonName)
	for k,v in ipairs(tab) do
		if (strlower(v) == strlower(buttonName)) then
			tremove(tab,k);
		end
	end
end

displayDisabledMail = function()
	-- Will return if the button should be shown
	local result = true;
	if ((bachMBF.db.profile.disabledMail == false) or (bachMBF.db.profile.MBFHideMiniMapMailFrame == true) or (HasNewMail()) or ((bachMBF.db.profile.grabBlizzButtons == true) and (isInTable(bachMBF.db.profile.MBF_Ignore,"MiniMapMailFrame") == true)) or ((bachMBF.db.profile.grabBlizzButtons == false) and (isInTable(bachMBF.db.profile.MBF_Include,"MiniMapMailFrame") == false))) then
		result = false;
	end
	return result;
end

-- Button Skinning Functions

function MBFAddSkin(tID, tBorderPath, tBackdropPath, size)
	tList[tID] = tID;
	tBorder[tID] = tBorderPath;
	tBackdrop[tID] = tBackdropPath;
	tSize[tID] = size;
end

function textureFrame(frame)
local miniButton;

	for i = 1, select("#", frame:GetChildren()) do
		miniButton = select(i, frame:GetChildren());
		textureButton(miniButton);
	end
	
	-- Blizz Button Tweaks
	if ((bachMBF.db.profile.grabBlizzButtons == true) and (isInTable(bachMBF.db.profile.MBF_Ignore,"GameTimeFrame") == false)) or (isInTable(bachMBF.db.profile.MBF_Include,"GameTimeFrame") == true) then
			MBFSkinMinimapButton(GameTimeFrame,1);
	end	
end

function removeTextures(miniButton)
	if miniButton:GetName() == "MiniMapTracking" then
		miniButton = _G["MiniMapTrackingButton"];
	end

	for _, r in pairs({miniButton:GetRegions()}) do
		if r:GetObjectType() == "Texture" then
			rName = r:GetName();
			rTex = r:GetTexture();
			rDL = r:GetDrawLayer();
			if (rTex and string.find(rTex, "TrackingBorder")) or (rName and string.find(rName, "TrackingButtonBorder")) or (rName and string.find(rName, "MinimapButtonBorder")) then
				r:Show();
				if not(rTex) then
					r:SetTexture("Interface\\Minimap\\Minimap-TrackingBorder")
				end
			end
		end
	end
	
	if miniButton.MBFoTex then
		miniButton.MBFoTex:SetTexture(nil);
		miniButton.MBFoTex:Hide();
	end

	if miniButton.MBFbTex then
		miniButton.MBFbTex:SetTexture(nil);
		miniButton.MBFbTex:Hide();
	end
end

function textureButton(miniButton)
local buttonName, buttonType, rName, rTex, rDL, foundOverlay;
local override = 0

	buttonName = miniButton:GetName();
	buttonType = miniButton:GetObjectType();
	if (buttonName == "MiniMapTrackingButton") or (buttonName == "QueueStatusMinimapButton") then
		override = 1;
	end
	
	if buttonName and (buttonType == "Button" or (buttonType == "Frame" and (buttonName == "MiniMapMailFrame" or buttonName == "BejeweledMinimapIcon" or buttonName == "PeggledMinimapIcon"))) and (not isInTable(SkinProtect, buttonName)) then
		foundOverlay = false;
		for _, r in pairs({miniButton:GetRegions()}) do
			if r:GetObjectType() == "Texture" then
				rName = r:GetName();
				rTex = r:GetTexture();
				rDL = r:GetDrawLayer();
                
				if ((rDL == "OVERLAY") or (rTex and string.find(rTex, "TrackingBorder"))) then
					foundOverlay = true;
					r:Hide();
					MBFSkinMinimapButton(miniButton,override);
				elseif ((rDL == "ARTWORK") and (rTex and string.find(rTex, "Background"))) then
					r:SetDrawLayer("ARTWORK",-8);
				elseif (((rDL == "BACKGROUND") or (rDL == "BORDER") or (rDL == "ARTWORK")) and (buttonName ~= "WIM3MinimapButton")) then
					if (rName == "MBFBackground") then
						r:SetDrawLayer("BACKGROUND");
					else
						--r:SetDrawLayer("ARTWORK");
					end
				end
			end
		end
		if (foundOverlay == false) then
			MBFSkinMinimapButton(miniButton);
		end
	elseif (buttonName and (buttonType == "Frame")) then
		textureFrame(miniButton);
	end
end

function MBFSkinMinimapButton(miniButton, override)
	local size = tSize[bachMBF.db.profile.currentTexture];

	if (override == nil) then
		override = 0;
	end

	if not miniButton.MBFoTex then 
		miniButton.MBFoTex = miniButton:CreateTexture("MBFOverlay","ARTWORK",nil,7);
	end

	if (tBorder[bachMBF.db.profile.currentTexture] == nil) then
		miniButton.MBFoTex:SetTexture(nil);
		miniButton.MBFoTex:Hide();
	else
		miniButton.MBFoTex:Show();
		miniButton.MBFoTex:SetTexture(tBorder[bachMBF.db.profile.currentTexture]);
		miniButton.MBFoTex:SetWidth(size);
		miniButton.MBFoTex:SetHeight(size);
		miniButton.MBFoTex:ClearAllPoints();
		miniButton.MBFoTex:SetPoint("CENTER");
		miniButton.MBFoTex:SetDrawLayer("OVERLAY",7);
	end
	
	if (override ~= 1) then
		if not miniButton.MBFbTex then 
			miniButton.MBFbTex = miniButton:CreateTexture("MBFBackground","ARTWORK",nil,-8); 
		end

		if (tBackdrop[bachMBF.db.profile.currentTexture] == nil) then
			miniButton.MBFbTex:SetTexture(nil);
			miniButton.MBFbTex:Hide();
		else
			miniButton.MBFbTex:Show();
			miniButton.MBFbTex:SetDrawLayer("BACKGROUND", -8);
			miniButton.MBFbTex:SetTexture(tBackdrop[bachMBF.db.profile.currentTexture]);
			miniButton.MBFbTex:ClearAllPoints();
			miniButton.MBFbTex:SetPoint("CENTER");
			miniButton.MBFbTex:SetWidth(size); 
			miniButton.MBFbTex:SetHeight(size);
		end
	end
end

-- Button Gathering Functions

function findButtons(frame)
	local i, child, childSize
	
	for i, child in ipairs({frame:GetChildren()}) do
		if (child:GetName() == "CECBMiniMapButtonFrame") then
			child = CECBMiniMapButton;
		end

		childSize = child:GetWidth()

		if (isValidAdd(child, true)) and childSize > 15 and childSize < 40 then
			addButton(child);
		end
	end
end

function findIncluded()
	local miniButton, k, v;
	for k,v in ipairs(bachMBF.db.profile.MBF_Include) do
		miniButton = _G[v];
		if (miniButton ~= nil) and (miniButton:IsShown()) then
			addButton(miniButton);
		end
	end
end

saveOldData = function(miniButton)
	local result = false;
	oldPoint = nil;

	oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs = miniButton:GetPoint();

	if oldPoint ~= nil then
		oldName = miniButton:GetName();
		--oldParentName = miniButton:GetParent():GetName();
		oldParentName = miniButton:GetParent();
		oldFrameLevel = miniButton:GetFrameLevel();
		oldOnDragStart = miniButton:GetScript('OnDragStart');
		oldOnDragStop = miniButton:GetScript('OnDragStop');
		oldOnEvent = miniButton:GetScript('OnEvent');
		oldWidth = miniButton:GetWidth();
		oldHeight = miniButton:GetHeight();
		oldScale = miniButton:GetScale();
		oldLevel = miniButton:GetFrameLevel();
		oldStrata = miniButton:GetFrameStrata();

		MBF_ButtonInfoStorage[miniButton:GetName()] = { oldName, oldParentName, oldFrameLevel, oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs, oldOnDragStart, oldOnDragStop, oldOnEvent, oldWidth, oldHeight, oldScale, oldLevel, oldStrata };
		result = true;
	end
	return result;
end

function saveAndDisableChildScripts(miniButton)
	local childName;
	local childParentName;
	local childOnDragStart;
	local childOnDragStop;
	local childOnEvent;

	if not isInTable(BlizzButtons, miniButton:GetName()) then
		for i, child in ipairs({miniButton:GetChildren()}) do
			childName = child:GetName();

			if (childName ~= nil) then
				childParentName = child:GetParent():GetName();
				childOnDragStart = child:GetScript('OnDragStart');
				childOnDragStop = child:GetScript('OnDragStop');
				childOnEvent = child:GetScript('OnEvent');

				MBF_ChildEventStorage[childName] = {childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent};	

				child:SetScript('OnDragStart', nil);
				child:SetScript('OnDragStop', nil);
				
				if (isInTable(BlizzButtons, childName) == false) then
					child:SetScript('OnEvent', nil);
				end
			end
		end
	end
end

removeChildScriptStorageRow = function(buttonName)
	local childName;
	local childParentName;
	local childOnDragStart;
	local childOnDragStop;
	local childOnEvent;
	local result = false;
	local DummyTable = {};	

	for k,v in pairs(MBF_ChildEventStorage) do
		childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent = unpack(v);

		if(childParentName == buttonName) then
			result = true;
		else
			DummyTable[childName] = { childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent };
		end
	end
	MBF_ChildEventStorage = DummyTable;
	DummyTable = {};
	return result;
end

function restoreChildScripts(miniButton)
	local oldChild;
	local childName;
	local childParentName;
	local childOnDragStart;
	local childOnDragStop;
	local childOnEvent;
	local buttonName = miniButton:GetName();
	local success = false;

	if not isInTable(BlizzButtons, buttonName) then
		for i, child in ipairs({miniButton:GetChildren()}) do

			oldChild = MBF_ChildEventStorage[child:GetName()]
			if oldChild ~= nil then

				childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent = unpack(oldChild);

				child:SetScript('OnDragStart', childOnDragStart);
				child:SetScript('OnDragStop', childOnDragStop);
				child:SetScript('OnEvent', childOnEvent);
			end
		end
		
		if oldChild ~= nil then
			success = removeChildScriptStorageRow(buttonName);

			if (success == false) then
				bachMBF:Print(L["MBF_ERR5"] .. " : " .. buttonName);
			end
		end
	end
 end

addButton = function(miniButton)
	local transferResult = false;

	if miniButton:GetParent() ~= MinimapButtonFrame then
		local buttonName = miniButton:GetName();

		if saveOldData(miniButton) then

			miniButton:SetParent(MinimapButtonFrame)
			miniButton:SetScript('OnDragStart', nil);
			miniButton:SetScript('OnDragStop', nil);
			
			if (isButtonFrame(miniButton)) then
				saveAndDisableChildScripts(miniButton);
			end
			
			if (isBlizzButton(buttonName) == false) then
				miniButton:SetScript('OnEvent', nil);
			end
			if (buttonName == "BigFootMinimapButton") then
				miniButton:SetScript('OnShow', nil);
				miniButton:SetFrameLevel(MinimapButtonFrame:GetFrameLevel()+1)
			end
			if ((buttonName == "MiniMapTracking") or (buttonName == "GameTimeFrame") or (buttonName == "FeedbackUIButton")) then
				miniButton:SetWidth(36);
				miniButton:SetHeight(34);
			end
			if (buttonName == "MonkeyBuddyIconButton") then
				miniButton:SetWidth(33);
				miniButton:SetHeight(33);
			end
			if ((miniButton:GetHeight() ~= 33) and (buttonName ~= "AM_MinimapButton") and (buttonName ~= "BejeweledMinimapIcon") and (buttonName == "PeggledMinimapIcon")) then
				miniButton:SetScale(33 / miniButton:GetHeight());
			end

			textureButton(miniButton);
			transferResult = true;
		end
	end
	return transferResult;
end

restoreButtonSettings = function(miniButton)
	local buttonName = miniButton:GetName();
	local foundButton = false;

	-- Load row and Remove from Storage
	
	if MBF_ButtonInfoStorage[buttonName] ~= nil then
		
		oldName, oldParentName, oldFrameLevel, oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs, oldOnDragStart, oldOnDragStop, oldOnEvent, oldWidth, oldHeight, oldScale, oldLevel, oldStrata = unpack(MBF_ButtonInfoStorage[buttonName]);

		miniButton:ClearAllPoints();
		if (oldPoint ~= nil) then
			miniButton:SetPoint(oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs);
		end
		miniButton:SetParent(oldParentName);
		miniButton:SetFrameLevel(oldFrameLevel);
		miniButton:SetScript('OnDragStart', oldOnDragStart);
		miniButton:SetScript('OnDragStop', oldOnDragStop);
		miniButton:SetScript('OnEvent', oldOnEvent);
		miniButton:SetWidth(oldWidth);
		miniButton:SetHeight(oldHeight);
		miniButton:SetScale(oldScale);
		miniButton:SetFrameLevel(oldLevel);
		miniButton:SetFrameStrata(oldStrata);

		if (miniButton:GetNumChildren() > 0) then
			restoreChildScripts(miniButton);
		end

		miniButton:GetParent():Show();
		
		removeTextures(miniButton);

		foundButton = true;
		MBF_ButtonInfoStorage[buttonName] = nil;
	end
	return foundButton;
end

function ClearMBF()
	for i, miniButton in ipairs({MinimapButtonFrame:GetChildren()}) do
		removeButton(miniButton, 1);
	end
end

function removeButton(miniButton, clear)
	local success = false;
	local isBlizz = false;

	if (miniButton:GetParent() == MinimapButtonFrame and (miniButton:GetName() ~= "MinimapButtonFrameDragButton")) then
		if (miniButton:GetName() == "MiniMapMailFrameDisabled") then
			miniButton = MiniMapMailFrame;
			MiniMapMailFrameDisabled:Hide();
		elseif (miniButton:GetName() == "MiniMapMailFrame") then
			MiniMapMailFrameDisabled:Hide();
		end
		
		success = restoreButtonSettings(miniButton);
		
		if ((success) and (clear == 0)) then
			if (isInTable(bachMBF.db.profile.MBF_Include, miniButton:GetName())) then
				removeFromTable(bachMBF.db.profile.MBF_Include, miniButton:GetName());
			elseif (isInTable(bachMBF.db.profile.MBF_Ignore, miniButton:GetName()) == false) then
				isBlizz = isBlizzButton(miniButton:GetName());
				if (((isBlizz and bachMBF.db.profile.grabBlizzButtons) or (isBlizz == false)) and (miniButton:GetName() ~= "LibDBIcon10_MBF")) then
					tinsert(bachMBF.db.profile.MBF_Ignore, miniButton:GetName());
				end 
			end
		elseif (success == false) and (clear == 0) then
			bachMBF:Print(L["MBF_ERR1"] .. " : " .. miniButton:GetName());
		end

		if (clear == 0) then
			bachMBF:Scan()
		end
	else
		if (((isInTable(bachMBF.db.profile.ParentStop, miniButton:GetParent():GetName()) == true) or (isInTable(BlizzParentStop, miniButton:GetParent():GetName()) == true)) and (miniButton:GetName() ~= "MiniMapMailFrame")) then
			bachMBF:Print(L["MBF_ERR2"] .. " : " .. miniButton:GetName());
		elseif (miniButton:GetName() ~= "MinimapButtonFrameDragButton") and (miniButton:GetName() ~= "MiniMapMailFrame") then 
			removeButton(miniButton:GetParent(), clear);
		end
	end
end

function removeInvisible(miniButton)
	local success = false;
	if ((miniButton:GetParent() == MinimapButtonFrame) and (miniButton:GetName() ~= "MinimapButtonFrameDragButton"))then
		success = restoreButtonSettings(miniButton);
		if (success == false) then
			bachMBF:Print(L["MBF_ERR3"] .. " : " .. miniButton:GetName());
		end
	end
end

function removeBlizzButtons()
local miniButton;
local mbfHide = bachMBF.db.profile.mbfHidden;

	if (mbfHide == true) then
		MinimapButtonFrame:Show();
		MBFRestoreButtonFrame:Show();
	end
	for k,v in pairs(BlizzButtons) do
		miniButton = _G[v];
		if (miniButton ~= nil) and (miniButton:IsShown()) and (isInTable(bachMBF.db.profile.MBF_Ignore,v) == false) then
			removeButton(miniButton, 0)
		elseif ((v == "MiniMapMailFrame") and (isInTable(bachMBF.db.profile.MBF_Ignore,v) == false)) then
			removeButton(miniButton, 0)
		end
	end
	if (mbfHide == true) then
		MinimapButtonFrame:Hide();
		MBFRestoreButtonFrame:Hide();
	end
end

function includeButton(miniButton)
	local buttonName = miniButton:GetName();
	local parentName;

	if (buttonName ~= "WorldFrame") then
		parentName = miniButton:GetParent():GetName();
		if (isValidAdd(miniButton,false)) then
			if (isInTable(bachMBF.db.profile.ParentStop, parentName) or isInTable(BlizzParentStop, parentName)) then
				if addButton(miniButton) then
					if (isInTable(bachMBF.db.profile.MBF_Ignore, buttonName)) then
						removeFromTable(bachMBF.db.profile.MBF_Ignore, buttonName);
					else
						tinsert(bachMBF.db.profile.MBF_Include, buttonName);
					end
					bachMBF:Scan()
				else
					bachMBF:Print(L["MBF_ERR6"] .. " : " .. miniButton:GetName());
				end
			else
				includeButton(miniButton:GetParent())
			end
		else
			if (miniButton:GetName() ~= nil) then
				bachMBF:Print(L["MBF_ERR4"] .. " : " .. miniButton:GetName());
			else
				bachMBF:Print(L["MBF_ERR4"] .. " : " .. L["MBF_UnnamedObject"]);
			end
		end 
	else
		bachMBF:Print(L["MBF_ERR4"] .. " : " .. miniButton:GetName());
	end
end

local sortChildren = function()
	if (bachMBF.db.profile.sortOrder ~= L["Custom"]) then
		local buttonName;
		local Children = {};
		local Blizz = {};
		for i, miniButton in ipairs({MinimapButtonFrame:GetChildren()}) do
			buttonName = miniButton:GetName();
			if ((miniButton:IsShown()) or (bachMBF.db.profile.mbfHidden)) then
				if (((bachMBF.db.profile.sortOrder == L["Blizzard First"]) or (bachMBF.db.profile.sortOrder == L["Blizzard Last"])) and (isBlizzButton(buttonName))) then
					tinsert(Blizz, buttonName);
				else 
					tinsert(Children, buttonName);
				end
			else
				if (((buttonName ~= "MiniMapMailFrame") or (bachMBF.db.profile.MBFHideMiniMapMailFrame == true) or (bachMBF.db.profile.disabledMail == false)) and (buttonName ~= "MiniMapMailFrameDisabled")) then
					if (MinimapButtonFrame:IsShown()) then
						removeInvisible(miniButton);
					end
				elseif ((bachMBF.db.profile.sortOrder == L["Blizzard First"]) or (bachMBF.db.profile.sortOrder == L["Blizzard Last"])) then
					if ((displayDisabledMail()) or (buttonName == "MiniMapMailFrame")) then
						tinsert(Blizz, buttonName);
					end
				else
					if ((displayDisabledMail()) or (buttonName == "MiniMapMailFrame")) then
						tinsert(Children, buttonName);
					end
				end
			end
		end
		sort(Blizz);
		sort(Children);
		if (bachMBF.db.profile.sortOrder == L["Blizzard First"]) then
			for i, miniButton in ipairs(Children) do
				tinsert(Blizz, miniButton);
			end
			return Blizz;
		elseif (bachMBF.db.profile.sortOrder == L["Blizzard Last"]) then
			for i, miniButton in ipairs(Blizz) do
				tinsert(Children, miniButton);
			end
			return Children;
		else	
			return Children;
		end
	else
		return bachMBF.db.profile.customChildren
	end
end

function updatePositions()

	local processMail = false;
	local childExceptions = 2
	
	local avgButtonSize = 33 + bachMBF.db.profile.padding;
	local spacer = avgButtonSize / 2;
	local x = spacer + 5;
	local y = -spacer - 5;
	
	local crPad;
	local iterator = 1;

	local numChildrenRC = ceil((MinimapButtonFrame:GetNumChildren() - childExceptions) / bachMBF.db.profile.columns_or_rows);
	local userSize = (bachMBF.db.profile.columns_or_rows * avgButtonSize)
	local dynamicSize = (numChildrenRC * avgButtonSize)

	if (bachMBF.db.profile.sort_by_rows) then
		MinimapButtonFrame:SetHeight(userSize + 10);
		MinimapButtonFrame:SetWidth(dynamicSize + 10);
	else
		MinimapButtonFrame:SetWidth(userSize + 10);
		MinimapButtonFrame:SetHeight(dynamicSize + 10);
	end		

	setMBFLocation();
	
	for i, buttonName in ipairs(sortChildren()) do

		local miniButton = _G[buttonName];

		if ((buttonName ~= "MinimapButtonFrameDragButton") and (buttonName ~= "MiniMapMailFrameDisabled") and (miniButton ~= nil) and (((MinimapButtonFrame:IsShown()) and (buttonName == "MiniMapMailFrame") or (miniButton:IsShown())))) then
			
			miniButton:SetFrameStrata("MEDIUM");
			miniButton:SetFrameLevel(MinimapButtonFrame:GetFrameLevel() + 1);
			
			if ((mod(iterator-1,bachMBF.db.profile.columns_or_rows) == 0) and iterator > 1) then
				if (bachMBF.db.profile.sort_by_rows) then
					y = -spacer - 5;
					x = x + avgButtonSize;
				else
					y = y - avgButtonSize;
					x = spacer + 5;
					
				end
			end

			miniButton:ClearAllPoints();
			
			if (miniButton:GetScale() ~= 1) then
				if bachMBF.db.profile.GrowUp then
					miniButton:SetPoint("CENTER", MinimapButtonFrame, "BOTTOMLEFT", x + (x * (1 - miniButton:GetScale())), -y - (y * (1 - miniButton:GetScale())));
				else
					miniButton:SetPoint("CENTER", MinimapButtonFrame, "TOPLEFT", x + (x * (1 - miniButton:GetScale())), y + (y * (1 - miniButton:GetScale())));
				end
			else
				if bachMBF.db.profile.GrowUp then
					miniButton:SetPoint("CENTER", MinimapButtonFrame, "BOTTOMLEFT", x, -y);
				else
					miniButton:SetPoint("CENTER", MinimapButtonFrame, "TOPLEFT", x, y);
				end
			end
			
			if (bachMBF.db.profile.sort_by_rows) then
				y = y - avgButtonSize;
			else
				x = x + avgButtonSize;
			end

			iterator = iterator + 1;
			
			if (buttonName == "MiniMapMailFrame") then
				MiniMapMailFrameDisabled:ClearAllPoints();
				MiniMapMailFrameDisabled:SetPoint(miniButton:GetPoint());
				if (HasNewMail()) then
					MiniMapMailFrameDisabled:Hide();
					MiniMapMailFrameDisabled:SetFrameLevel(MiniMapMailFrame:GetFrameLevel()-1)
					MiniMapMailFrame:Show()
				elseif ((bachMBF.db.profile.grabBlizzButtons == true) and (bachMBF.db.profile.disabledMail == true)) then
					MiniMapMailFrameDisabled:Show();
					MiniMapMailFrameDisabled:SetFrameLevel(MiniMapMailFrame:GetFrameLevel()+1)
				end
			end
		elseif (buttonName == "MiniMapMailFrameDisabled") then
			if (displayDisabledMail()) then 
				MiniMapMailFrameDisabled:Show();
				MiniMapMailFrameDisabled:SetFrameLevel(MiniMapMailFrame:GetFrameLevel()+1)
			else
				MiniMapMailFrameDisabled:Hide();
				MiniMapMailFrameDisabled:SetFrameLevel(MinimapButtonFrame:GetFrameLevel()-1)
			end
		end
		miniButton = "";
	end
	i = "";
	buttonName = "";
end

function bachMBF:Scan()

	if not InCombatLockdown() then
		if currentProfile ~= self.db:GetCurrentProfile() then
			setFrameDefaults()

			MiniMapTracking:Show()
			MiniMapWorldMapButton:Show()
			MinimapZoomIn:Show()
			MinimapZoomOut:Show()
			GameTimeFrame:Show()
			if HasNewMail() then
				MiniMapMailFrame:Show()
			end
			ClearMBF()
		end

		MBFC_KeepBlizzHidden()
		findButtons(Minimap)
		findButtons(MinimapBackdrop)
		findIncluded()
		if isValidAdd(GameTimeFrame, true) then
			addButton(GameTimeFrame)
		end
		updatePositions()
		if currentProfile ~= self.db:GetCurrentProfile() then self:Init() end
		self:SwapTitleLocation()

		if MinimapButtonFrame:GetNumChildren() ~= numButtons then
			for i, miniButton in ipairs({MinimapButtonFrame:GetChildren()}) do
				if miniButton:GetName() ~= "MinimapButtonFrameDragButton" and miniButton:GetName() ~= "MiniMapMailFrameDisabled" then 
					childList[miniButton:GetName()] = miniButton:GetName()
				end
			end

			i = nil
			miniButton = nil

			updateCustomChildren();
			numButtons = MinimapButtonFrame:GetNumChildren()
		end
		
		if not scanned then
			MBFC_CheckSkin();
			textureFrame(MinimapButtonFrame);
			scanned = true
		end
	end
end

-- Config Functions

function MBFC_Toggle ()
	if SettingsPanel:IsShown() then
		SettingsPanel:Hide();
	else
		SettingsPanel:OpenToCategory("MinimapButtonFrame");
	end
end

function MBFC_Visible(source, parentName) 
local activate = false;
	
	if (source == 1) then -- From MBF Minimap Button
		if (bachMBF.db.profile.grabMBFButton == false) then
			activate = true;
		end
	elseif (source == 2) then -- From FuBar or Titan Plugin
		if (parentName ~= "MinimapButtonFrame") then
			activate = true;
		end
	elseif (source == 3) then -- Command Line Show
		if (bachMBF.db.profile.mbfHidden == true) then
			activate = true;
		end	
	elseif (source == 4) then -- Command Line Hide
		if (bachMBF.db.profile.mbfHidden == false) then
			activate = true;
		end
	end

	if (activate) then 
		if MinimapButtonFrame:IsShown() then
			MinimapButtonFrame:Hide();
			MBFRestoreButtonFrame:Hide();
			bachMBF.db.profile.mbfHidden = true;
		else
			MinimapButtonFrame:Show();
			if not bachMBF.db.profile.locked then
				MBFRestoreButtonFrame:Show();
				MinimapButtonFrameDragButton:Show();
			end
			MBFRestoreButton:Hide();
			bachMBF.db.profile.mbfHidden = false;
		end
	end
end

function setFrameDefaults()
	-- Set the MBF Frame, dragButton, and restore button to their default visiblility
		MinimapButtonFrame:Show();
		MinimapButtonFrameDragButton:Show();
		MBFRestoreButtonFrame:Show();
		MBFRestoreButton:Hide();		
end

function MBFC_KeepBlizzHidden()
	if bachMBF.db.profile.MBFHideMiniMapTracking == true then
		MiniMapTracking:Hide();
	end
	if bachMBF.db.profile.MBFHideMiniMapWorldMapButton == true then
		MiniMapWorldMapButton:Hide();
	end
	if bachMBF.db.profile.MBFHideMinimapZoomIn  == true then
        Minimap.ZoomIn.Show = function() end;
        Minimap.ZoomOut.Show = function() end;
		Minimap.ZoomIn:Hide();
		Minimap.ZoomOut:Hide();
	end
	if bachMBF.db.profile.MBFHideMiniMapMailFrame == true then
		MiniMapMailFrame:Hide();
		MiniMapMailFrameDisabled:Hide();	
	end
	if bachMBF.db.profile.MBFHideGameTimeFrame == true then
		GameTimeFrame:Hide();
	end
end

function MBFC_LoadStandardSkins()
	MBFAddSkin("Blizzard", "Interface\\AddOns\\MinimapButtonFrameRedux\\Textures\\BlizzBorder.tga", nil, 55);
	MBFAddSkin("Blizzard Square", "Interface\\AddOns\\MinimapButtonFrameRedux\\Textures\\BlizzSquare.tga", "Interface\\Buttons\\UI-EmptySlot", 45);
end

function MBFC_CheckSkin()
	local tLoaded = false;
	for i, id in pairs(tList) do
		if bachMBF.db.profile.currentTexture == id then
			tLoaded = true;
			break;
		end
	end
	if tLoaded == false then
		bachMBF.db.profile.currentTexture = "Blizzard";
	end
end

function MBFC_ColorLocked() 
	local red = bachMBF.db.profile.MBFBackdropColor.Red;
	local green = bachMBF.db.profile.MBFBackdropColor.Green;
	local blue = bachMBF.db.profile.MBFBackdropColor.Blue;
	local opacity = bachMBF.db.profile.MBFBackdropColor.Alpha;	
    local layout = NineSliceUtil.GetLayout("TooltipDefaultLayout")
    
    NineSliceUtil.ApplyLayout(MinimapButtonFrame, layout)
    Mixin(MinimapButtonFrame, NineSlicePanelMixin)
    MinimapButtonFrame:Show()

	if ((bachMBF.db.profile.locked) and (bachMBF.db.profile.colorLocked == "All")) then
        MinimapButtonFrame:SetCenterColor(0,0,0,0)
        MinimapButtonFrame:SetBorderColor(0,0,0,0)
	elseif ((bachMBF.db.profile.locked) and (bachMBF.db.profile.colorLocked == "Border")) then
        MinimapButtonFrame:SetCenterColor(red, green, blue, opacity)
        MinimapButtonFrame:SetBorderColor(0,0,0,opacity)
	elseif ((bachMBF.db.profile.locked) and (bachMBF.db.profile.colorLocked == "Background")) then
        MinimapButtonFrame:SetCenterColor(0,0,0,0)
        MinimapButtonFrame:SetBorderColor(1,1,1,1)
	else
        MinimapButtonFrame:SetCenterColor(red, green, blue, opacity)
        MinimapButtonFrame:SetBorderColor(1,1,1,opacity)

	end
end

function MBFC_RollUp(setting)
	if (setting == 1) then
		MBFRestoreButton:ClearAllPoints();
		MBFRestoreButton:SetPoint(MinimapButtonFrameDragButton:GetPoint());
		MBFRestoreButton:Show();
		MBFRestoreButton:SetFrameLevel(MinimapButtonFrameDragButton:GetFrameLevel());
		MBFRestoreButton:SetFrameStrata(MinimapButtonFrameDragButton:GetFrameStrata());
		bachMBF.db.profile.rollUp = true;
		bachMBF.db.profile.mbfHidden = true;
		MinimapButtonFrame:Hide();
	elseif (setting == 2) then
		MinimapButtonFrameDragButton:ClearAllPoints();
		MinimapButtonFrameDragButton:SetPoint(MBFRestoreButton:GetPoint());
		MBFRestoreButton:Hide();
		bachMBF.db.profile.rollUp = false;
		bachMBF.db.profile.mbfHidden = false;
		MinimapButtonFrame:Show();
	end
end

function bachMBF:SetTitleSize(mbfWidth, mbfHeight)
	if mbfWidth <= mbfHeight then
		MinimapButtonFrameDragButton:SetWidth(mbfWidth);
		MinimapButtonFrameDragButton:SetHeight(28);
		MBFRestoreButtonFrame:SetWidth(mbfWidth);
		MBFRestoreButtonFrame:SetHeight(28);
		MBFRestoreButton:SetWidth(mbfWidth);
		MBFRestoreButton:SetHeight(28);
	else
		MinimapButtonFrameDragButton:SetWidth(28);
		MinimapButtonFrameDragButton:SetHeight(mbfHeight);
		MBFRestoreButtonFrame:SetWidth(28);
		MBFRestoreButtonFrame:SetHeight(mbfHeight);
		MBFRestoreButton:SetWidth(28);
		MBFRestoreButton:SetHeight(mbfHeight);
	end
end

function bachMBF:SwapTitleLocation()
	local mbfWidth = MinimapButtonFrame:GetWidth();
	local mbfHeight = MinimapButtonFrame:GetHeight();

	MinimapButtonFrameDragButton:ClearAllPoints();
	MBFRestoreButtonFrame:ClearAllPoints();

	self:SetTitleSize(mbfWidth, mbfHeight);

    local buttonText = bachMBF.db.profile.buttonText or " MBF "

	if (mbfWidth <= mbfHeight) and (mbfWidth < 80) then
        if #buttonText >= 3 then
            MBFRestoreButton:SetText(string.sub(buttonText,1,3))
            MinimapButtonFrameDragButton:SetText(string.sub(buttonText,1,3))
        elseif #buttonText >= 2 then
            MBFRestoreButton:SetText(string.sub(buttonText,1,2))
            MinimapButtonFrameDragButton:SetText(string.sub(buttonText,1,2))
        elseif #buttonText >=1 then
            MBFRestoreButton:SetText(string.sub(buttonText,1,1))
            MinimapButtonFrameDragButton:SetText(string.sub(buttonText,1,1))
        else
            MBFRestoreButton:SetText("MBF")
            MinimapButtonFrameDragButton:SetText("MBF")
        end
	elseif (mbfWidth <= mbfHeight) and (mbfWidth >= 80) then
		MBFRestoreButton:SetText(" "..buttonText.." ")
		MinimapButtonFrameDragButton:SetText(" "..buttonText.." ")
	else
        if #buttonText >= 3 then
            MBFRestoreButton:SetText(string.sub(buttonText,1,1).."\n"..string.sub(buttonText,2,2).."\n"..string.sub(buttonText,3,3))
            MinimapButtonFrameDragButton:SetText(string.sub(buttonText,1,1).."\n"..string.sub(buttonText,2,2).."\n"..string.sub(buttonText,3,3))
        else
            MBFRestoreButton:SetText("M\nB\nF")
            MinimapButtonFrameDragButton:SetText("M\nB\nF")
        end
	end

	if (bachMBF.db.profile.altTitle) and (mbfWidth <= mbfHeight) then
		MinimapButtonFrameDragButton:SetPoint("BOTTOMLEFT", "MinimapButtonFrame", "BOTTOMLEFT", 0, -30)
		MBFRestoreButtonFrame:SetPoint("BOTTOMLEFT", "MinimapButtonFrame", "BOTTOMLEFT", 0, -31)
	elseif (bachMBF.db.profile.altTitle) and (mbfWidth > mbfHeight) then
		MinimapButtonFrameDragButton:SetPoint("TOPRIGHT", "MinimapButtonFrame", "TOPRIGHT", 30, 0)
		MBFRestoreButtonFrame:SetPoint("TOPRIGHT", "MinimapButtonFrame", "TOPRIGHT", 31, 0)
	elseif (mbfWidth <= mbfHeight) then
		MinimapButtonFrameDragButton:SetPoint("TOPLEFT", "MinimapButtonFrame", "TOPLEFT", 0, 30)
		MBFRestoreButtonFrame:SetPoint("TOPLEFT", "MinimapButtonFrame", "TOPLEFT", 0, 31)
	else
		MinimapButtonFrameDragButton:SetPoint("BOTTOMLEFT", "MinimapButtonFrame", "BOTTOMLEFT", -30, 0)
		MBFRestoreButtonFrame:SetPoint("BOTTOMLEFT", "MinimapButtonFrame", "BOTTOMLEFT", -31, 0)
	end	

	MBFRestoreButton:ClearAllPoints();
	MBFRestoreButton:SetPoint(MinimapButtonFrameDragButton:GetPoint());
	MBFRestoreButton:SetFrameLevel(MinimapButtonFrameDragButton:GetFrameLevel());
	MBFRestoreButton:SetFrameStrata(MinimapButtonFrameDragButton:GetFrameStrata());
end

function bachMBF:fillDropdowns()
	for i, name in pairs(self.db.profile.MinimapIcons) do
		minimapIconList[name] = name
	end
	for i, name in pairs(self.db.profile.ButtonOverride) do
		buttonOverrideList[name] = name
	end
end

function updateCustomChildren()
-- This will make sure that all the MBF Children are in the customChildren table
-- Don't remove any children from the list.  Should only run on whenever the # of buttons on MBF changes.
	local buttonName
	local miniButton
	local result = false

	for i, miniButton in ipairs({MinimapButtonFrame:GetChildren()}) do
		buttonName = miniButton:GetName()
		result = false
		for i, customButtonName in ipairs(bachMBF.db.profile.customChildren) do
			if buttonName == customButtonName then
				result = true
			end
		end
		if result == false then
			tinsert(bachMBF.db.profile.customChildren, buttonName)
		end
	end
	
end

function bachMBF:moveButton(direction)
-- Direction  1 - up  2 - down
	local custom = {}
	local deadButtons = {}
	local previous

	updateCustomChildren()

	for i, miniButton in pairs(bachMBF.db.profile.customChildren) do
		if direction == 1 then
			if _G[miniButton] == nil or miniButton == "MinimapButtonFrameDragButton" or miniButton == "MiniMapMailFrameDisabled" then
				if previous ~= "Button is Dead" then
					deadButtons = {};
					tinsert(deadButtons,previous)
				end
				tinsert(deadButtons, miniButton)
				previous = "Button is Dead"
			elseif i == 1 then
				previous = miniButton
			elseif miniButton == bachMBF.db.profile.currentChild then
				if previous == "Button is Dead" then
					tinsert(deadButtons, 1, miniButton)
				else
					tinsert(custom, miniButton)
				end
			else
				if previous == "Button is Dead" then
					for x, deadButton in pairs(deadButtons) do
						tinsert(custom, deadButton)
					end
				else
					tinsert(custom, previous)
				end
				previous = miniButton
			end
		elseif direction == 2 then
			if miniButton ~= bachMBF.db.profile.currentChild then
				tinsert(custom, miniButton)

				if previous == bachMBF.db.profile.currentChild and _G[miniButton] ~= nil and miniButton ~= "MinimapButtonFrameDragButton" and miniButton ~= "MiniMapMailFrameDisabled" then
					tinsert(custom, previous)
					previous = miniButton
				end

			else
				previous = bachMBF.db.profile.currentChild
			end
		end
	end
	if (direction == 2 and previous == bachMBF.db.profile.currentChild) or direction == 1 then
		if previous == "Button is Dead" then
			for x, deadButton in pairs(deadButtons) do
				tinsert(custom, deadButton)
			end
		else
			tinsert(custom, previous)
		end
	end

	bachMBF.db.profile.customChildren = custom
	bachMBF:Scan()
end 

-- Tooltips

function NoMail_OnEnter()
	GameTooltip:SetOwner(MiniMapMailFrameDisabled, "ANCHOR_LEFT");
	GameTooltip:SetText(L["No New Mail"]);
	GameTooltip:Show();
end

function RollUp_OnEnter(setting)
	if (setting == 1) then
		GameTooltip:SetOwner(MinimapButtonFrameDragButton, "ANCHOR_LEFT");
	elseif (setting == 2) then
		GameTooltip:SetOwner(MBFRestoreButton, "ANCHOR_LEFT");
	end
	GameTooltipTextLeft1:SetTextColor(1, 1, 1);
	GameTooltip:AddLine(L["MBF_TOOLTIP_ROLLUP"]);
	GameTooltip:Show();
end
