local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "zhTW")
if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
BINDING_NAME_MBF_CONFIG = "設定開關"
BINDING_NAME_MBF_TOGGLE = "MBF開關"
BINDING_NAME_MBF_ADD = "增加按鈕"
BINDING_NAME_MBF_REMOVE = "移除按鈕"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "沒有新的郵件"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00點擊|r to 隱藏/顯示MBF框架 \n|cff1eff00Shift+點擊|r 打開設定"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00點擊|r to 隱藏/顯示MBF框架 \n|cff1eff00Shift+點擊|r 打開設定\n|cff1eff00右鍵拖曳|r 移動位置"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift+點擊|r 打開設定"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00點擊 + 拖曳|r 移動 MBF\n|cff1eff00右鍵|r to 隱藏/顯示 框架"

-- Error Messages
L["MBF_ERR1"] = "移除按鈕時發生錯誤"
L["MBF_ERR2"] = "只能移除MBF中的按鈕"
L["MBF_ERR3"] = "移除無形按鈕時發生錯誤"
L["MBF_ERR4"] = "無法增加. 已鎖定或已存在"
L["MBF_ERR5"] = "移除子事件時發生錯誤"
L["MBF_ERR6"] = "未能增加按鈕，請重試"
L["MBF_ERR7"] = "按鈕或物件不存在"

-- Chat commands
L["MBF"] = true
L["usage"] = "用法"
L["Version"] = "版本"
L["info"] = true
L["show"] = true
L["hide"] = true
L["reload"] = true
L["help"] = true
L["debug"] = true
L["config"] = true
L["remove"] = true
L["add"] = true
L["MBF_SLASH_Detail1"] = "用法: /mbf [ add | remove | info | config | show | hide | reload | help ] "
L["MBF_SLASH_Detail2"] = "   add - 增加非自動收納的按鈕到MBF"
L["MBF_SLASH_Detail3"] = "remove - 移除已被MBF收納的按鈕"
L["MBF_SLASH_Detail4"] = "  info - 顯示游標下的按鈕資訊"
L["MBF_SLASH_Detail5"] = "config - 顯示設定視窗"
L["MBF_SLASH_Detail6"] = "  show - 顯示MBF"
L["MBF_SLASH_Detail7"] = "  hide - 隱藏MBF"
L["MBF_SLASH_Detail8"] = "reload - 重新應用紋理。 這將糾正變黑的圖標。"
L["MBF_SLASH_Detail9"] = "  help - 顯示命令的說明和資訊"

-- Display Info
L["Unnamed Object"] = "無效對象"
L["Unknown Object Type"] = "未知對象類型"
L["Object Type"] = "目標對象"
L["Parent"] = "父框架"
L["Unknown Parent Name"] = "未知父框架名稱"
L["No Parent"] = "無父框架"
L["Children"] = "子框架"

-- Display Options
L["Display"] = "顯示"
L["Display Settings"] = "顯示設定"

L["Button Text"] = "按鈕文本"
L["BUTTONTEXT_DESC"] = "在按鈕上顯示文字"

L["Locked"] = "鎖定"
L["LOCKED_DESC"] = "切換鎖定MBF框架"

L["Hide when Locked"] = "鎖定時隱藏部分"
L["HIDELOCKED_DESC"] = "鎖定MBF時，隱藏其中的部分元件"

L["ALTTITLE_DESC"] = "切換標題欄位置"
L["ALTTITLEDESC_DESC"] = "勾選後將標題欄設定在下方或右側，而不是預設的上方或左側"

L["Buttonskin"] = "按鈕外觀"
L["BUTTONSKIN_DESC"] = "設定按鈕外觀"

L["Background Color"] = "背景顏色"
L["COLOR_DESC"] = "設定背景顏色"

L["Columns or Rows"] = "行/列數"
L["CLR_DESC"] = "設定按鈕的列/行數"

L["MBF Anchor"] = "錨點"
L["MBFANCHOR_DESC"] = "延伸MBF框架的起始錨點"


L["Top Left"] = "左上"
L["Top Right"] = "右上"
L["Bottom Left"] = "左下"
L["Bottom Right"] = "右下"

L["Padding"] = "間距"
L["PADDING_DESC"] = "按鈕間距"

L["Opacity"] = "透明度"
L["OPACITY_DESC"] = "框架透明度"

L["Scale"] = "縮放"
L["SCALE_DESC"] = "框架縮放大小"


L["Name"] = "名稱"
L["Nothing"] = "不隱藏"
L["Border"] = "邊框"
L["Background"] = "背景"
L["All"] = "全部"

L["Blizzard"] = true
L["Blizzard Square"] = true

-- Gathering Options

L["Gathering"] = "收納"
L["Gathering Settings"] = "收納設定"

L["GATHERHEAD1_DESC"] = "MBF按鈕設定"
L["GATHERDESC1_DESC"] = "MBF按鈕設定"

L["Show Minimap Button"] = "顯示MBF小地圖按鈕"
L["SHOWBUTTON_DESC"] = "顯示MBF按鈕到小地圖旁"

L["Collect Button"] = "收納MBF小地圖按鈕"
L["COLLECT1_DESC"] = "收納MBF按鈕到MBF框架中"

L["GATHERHEAD2_DESC"] = "系統小地圖按鈕設定"
L["GATHERDESC2_DESC"] = "系統小地圖按鈕設定"

L["Collect Buttons"] = "收納系統的小地圖按鈕"
L["COLLECT2_DESC"] = "收納系統的小地圖按鈕"

L["Exclude Queue Button"] = "排除隊列按鈕"
L["ExcludeLFG_DESC"] = "排除隊列狀態按鈕"

L["Hide Mail"] = "隱藏新郵件圖示"
L["HIDEMAIL_DESC"] = "隱藏新郵件圖示"

L["Show No Mail Icon"] = "顯示無新郵件圖示"
L["NOMAIL_DESC"] = "顯示無新郵件圖示"

L["Hide Tracking"] = "隱藏追蹤技能按鈕"
L["TRACKING_DESC"] = "隱藏追蹤技能按鈕"

L["Hide Voice Chat"] = "隱藏語音聊天按鈕"
L["VOICECHAT_DESC"] = "隱藏語音聊天按鈕"

L["Hide Calendar"] = "隱藏日曆按鈕"
L["CALENDAR_DESC"] = "隱藏日曆按鈕"

L["Hide Zoom Buttons"] = "隱藏小地圖縮放按鈕"
L["ZOOM_DESC"] = "隱藏小地圖縮放按鈕"

L["Hide World Map"] = "隱藏世界地圖按鈕"
L["WORLDMAP_DESC"] = "隱藏世界地圖按鈕"


-- Exceptions Options

L["Exceptions"] = "例外"
L["Exceptions Settings"] = "例外設定"

L["Protected Items"] = "例外項目"
L["ICONSDESC_DESC"] = "誤被收納的項目，例如其他插件產生的圖示"

L["CURRENTEXCEPTIONS_DESC"] = "目前的例外項目"

L["Remove"] = "移除"
L["ICONREMOVE_DESC"] = "移除選定的例外項目"

L["ICONADDTITLE_DESC"] = "增加例外項目"
L["ICONADD_DESC"] = "例外項目名稱"

L["Button Override"] = "按鈕覆寫"
L["OVERRIDEDESC_DESC"] = "MBF認為是圖示，但其實是按鈕的物件"

L["Current Button Overrides"] = "當前按鈕覆寫"

L["OVERRIDEREMOVE_DESC"] = "刪除選定的按鈕覆寫"

L["Add Button Override"] = "增加按鈕覆寫"
L["OVERRIDEADD_DESC"] = "加入複寫設定的按鈕名稱"

-- Sorting Options

L["Sorting"] = "排序"
L["Sorting Settings"] = "排序設定"

L["Sort By Rows"] = "直向排列"
L["SBR_DESC"] = "改變MBF中按鈕的直排/橫排"

L["Grow Buttons Up"] = "反向排列"
L["GROWUP_DESC"] = "按鈕從下往上增加"

L["Sort Order"] = "排序方式"
L["SORTORDER_DESC"] = "選擇按鈕的排序方式"

L["Alphabetical"] = "字母排序"
L["Blizzard First"]  = "系統按鈕優先"
L["Blizzard Last"]  = "系統按鈕最後"
L["Custom"]  = "自訂"

L["UP"] = "向上"
L["DOWN"] = "向下"
L["UP_DESC"] = "移動選定按鈕向上"
L["DOWN_DESC"] = "移動選定按鈕向下"

-- Profile Options

L["Profiles"] = "設定檔"
