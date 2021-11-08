local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "zhCN")

if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "小地图按钮框架MBF"
BINDING_NAME_MBF_CONFIG = "设置开关"
BINDING_NAME_MBF_TOGGLE = "MBF开关"
BINDING_NAME_MBF_ADD = "添加按钮"
BINDING_NAME_MBF_REMOVE = "移除按钮"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "没有新的邮件"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00点击|r to 隐藏/显示MBF框体 \n|cff1eff00Shift+点击|r 打开设置"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00点击|r to 隐藏/显示MBF框体 \n|cff1eff00Shift+点击|r 打开设置\n|cff1eff00右键拖拽|r 移动位置"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift+点击|r 打开设置"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00点击 + 拖拽|r 移动 MBF\n|cff1eff00右键|r to 隐藏/显示 框体"

-- Error Messages
L["MBF_ERR1"] = "错误：移除按钮出错"
L["MBF_ERR2"] = "只能是MBF内按钮，不能移除框体."
L["MBF_ERR3"] = "错误：移除按钮不存在."
L["MBF_ERR4"] = "无法添加.  受保护或者已添加!"
L["MBF_ERR5"] = "错误：移除子事件."
L["MBF_ERR6"] = "巴顿不准备增加。  请重试。"
L["MBF_ERR7"] = "按钮或对象不存在。"

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
L["MBF_SLASH_Detail1"] = "用法 /mbf [ add | remove | info | config | show | hide | reload | help ] "
L["MBF_SLASH_Detail2"] = "add - 增加非自动采集按钮到MBF"
L["MBF_SLASH_Detail3"] = "remove - 移除MBF采集的按钮"
L["MBF_SLASH_Detail4"] = "info - 显示光标出按钮信息"
L["MBF_SLASH_Detail5"] = "config - 显示设置窗口."
L["MBF_SLASH_Detail6"] = "show - 显示MBF."
L["MBF_SLASH_Detail7"] = "hide - 隐藏MBF."
L["MBF_SLASH_Detail8"] = "reload - 重新应用纹理。 这将纠正变黑的图标."
L["MBF_SLASH_Detail9"] = "help - 显示命令的帮助和信息"

-- Display Info
L["Unnamed Object"] = "无效对象"
L["Unknown Object Type"] = "未知对象类型"
L["Object Type"] = "目标对象"
L["Parent"] = "父级框体"
L["Unknown Parent Name"] = "未知父级框体名称"
L["No Parent"] = "无父级框体"
L["Children"] = "儿童"

-- Display Options
L["Display"] = "显示"
L["Display Settings"] = "显示设置"

L["Button Text"] = "按钮文本"
L["BUTTONTEXT_DESC"] = "在按钮上显示文字"

L["Locked"] = "锁定"
L["LOCKED_DESC"] = "医疗保险基金切换帧是否已被锁定。"

L["Hide when Locked"] = "锁定后隐藏框体背景"
L["HIDELOCKED_DESC"] = "什么部分的框架时，应隐藏帧是锁定的。"

L["ALTTITLE_DESC"] = "候补标题栏的位置"
L["ALTTITLEDESC_DESC"] = "移动的标题栏的下方或右侧，而不是默认的顶部或左边。"

L["Buttonskin"] = "按钮皮肤"
L["BUTTONSKIN_DESC"] = "选择皮肤内的按钮。"

L["Background Color"] = "背景颜色"
L["COLOR_DESC"] = "选择背景颜色为医疗保险基金。"

L["Columns or Rows"] = "每行排列数"
L["CLR_DESC"] = "列数或行显示出来。"

L["MBF Anchor"] = "锚"
L["MBFANCHOR_DESC"] = "在角落里，该框架将增长到。"

L["Top Left"] = "最左"
L["Top Right"] = "右上"
L["Bottom Left"] = "底左"
L["Bottom Right"] = "右下角"

L["Padding"] = "间距"
L["PADDING_DESC"] = "多少钱之间填充的按钮。"

L["Opacity"] = "透明度"
L["OPACITY_DESC"] = "设置不透明的框架。"

L["Scale"] = "缩放"
L["SCALE_DESC"] = "设定的规模范围内。"

L["Name"] = "姓名"
L["Nothing"] = "--------"
L["Border"] = "隐藏边框"
L["Background"] = "隐藏背景"
L["All"] = "背景与边框"

L["Blizzard"] = "暴雪"
L["Blizzard Square"] = "暴雪广场"

-- Gathering Options

L["Gathering"] = "采集"
L["Gathering Settings"] = "采集设置"

L["GATHERHEAD1_DESC"] = "医疗保险基金的迷你按钮设置"
L["GATHERDESC1_DESC"] = "设置医疗保险基金迷你按钮"

L["Show Minimap Button"] = "显示小地图按钮"
L["SHOWBUTTON_DESC"] = "显示，医疗保险基金迷你按钮。"

L["Collect Button"] = "收纳MBF小地图按钮"
L["COLLECT1_DESC"] = "收集的医疗保险基金迷你按钮。"

L["GATHERHEAD2_DESC"] = "暴雪迷你按钮设置"
L["GATHERDESC2_DESC"] = "设置为暴雪迷你按钮"

L["Collect Buttons"] = "收纳小地图系统按钮"
L["COLLECT2_DESC"] = "收集的暴雪迷你按钮"

L["Exclude Queue Button"] = "排除队列按钮"
L["ExcludeLFG_DESC"] = "排除队列状态按钮"

L["Hide Mail"] = "隐藏系统邮件图标"
L["HIDEMAIL_DESC"] = "隐藏的暴雪新邮件图标"

L["Show No Mail Icon"] = "显示无新邮件图标"
L["NOMAIL_DESC"] = "显示的任何邮件图标时，您没有邮件。"

L["Hide Tracking"] = "隐藏系统追踪按钮"
L["TRACKING_DESC"] = "隐藏的暴雪追踪按钮"

L["Hide Voice Chat"] = "隐藏系统语音聊天按钮"
L["VOICECHAT_DESC"] = "隐藏的暴雪语音聊天按钮"

L["Hide Calendar"] = "隐藏日历"
L["CALENDAR_DESC"] = "隐藏的暴雪日历"

L["Hide Zoom Buttons"] = "隐藏系统小地图缩放按钮"
L["ZOOM_DESC"] = "隐藏的暴雪迷你变焦按钮"

L["Hide World Map"] = "隐藏世界地图按钮"
L["WORLDMAP_DESC"] = "隐藏的暴雪世界地图按钮"

-- Exceptions Options

L["Exceptions"] = "例外"
L["Exceptions Settings"] = "例外设置"

L["Protected Items"] = "保护项目"
L["ICONSDESC_DESC"] = "错误地收集项目。当然..收集器节点，用户界面项目。"

L["CURRENTEXCEPTIONS_DESC"] = "目前的保护项目。"

L["Remove"] = "删除"
L["ICONREMOVE_DESC"] = "删除选定的保护项目。"

L["ICONADDTITLE_DESC"] = "添加受保护的项目"
L["ICONADD_DESC"] = "该项目的广义名称受到保护。"

L["Button Override"] = "巴顿覆盖"
L["OVERRIDEDESC_DESC"] = "按钮的医疗保险基金认为是迷你图标，但真正的按钮。"

L["Current Button Overrides"] = "当前按钮覆盖"

L["OVERRIDEREMOVE_DESC"] = "删除选定的按钮覆写的例外"

L["Add Button Override"] = "添加按钮覆盖"
L["OVERRIDEADD_DESC"] = "的确切名称的按钮添加到该按钮覆写表。"

-- Sorting Options

L["Sorting"] = "排序"
L["Sorting Settings"] = "排序设置"

L["Sort By Rows"] = "排列方向"
L["SBR_DESC"] = "医疗保险基金的方向变化各种各样的迷你按钮。"

L["Grow Buttons Up"] = "成长扣"
L["GROWUP_DESC"] = "填充的按钮从下往上框架。"

L["Sort Order"] = "排序"
L["SORTORDER_DESC"] = "选择以便迷你按钮排序"

L["Alphabetical"] = "字母排序"
L["Blizzard First"]  = "系统钮优先"
L["Blizzard Last"]  = "系统钮最后"
L["Custom"]  = "自定义"

L["UP"] = "向上"
L["DOWN"] = "向下的"
L["UP_DESC"] = "移动选定的迷你按钮的命令行动"
L["DOWN_DESC"] = "移动选定的迷你按钮的命令下跌"

-- Profile Options

L["Profiles"] = "概况"
