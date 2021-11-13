local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "koKR", false)

if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
BINDING_NAME_MBF_CONFIG = "설정 표시/숨김"
BINDING_NAME_MBF_TOGGLE = "MBF 표시/숨김"
BINDING_NAME_MBF_ADD = "버튼 추가"
BINDING_NAME_MBF_REMOVE = "버튼 제거"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "새로운 우편 없음"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00왼쪽 클릭|r으로 프레임을 표시/숨김\n|cff1eff00Shift + 왼쪽 클릭|r으로 설정 화면 표시"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00왼쪽 클릭|r으로 프레임을 표시/숨김\n|cff1eff00Shift + 왼쪽 클릭|r으로 설정 화면 표시\n|cff1eff00오른쪽 클릭 + 드래그|r로 버튼 이동"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift + 왼쪽 클릭|r으로 설정 화면 표시"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00왼쪽 클릭 + 드래그|r로 MBF 이동\n|cff1eff00오른쪽 클릭|r으로 창을 표시/숨김"

-- Error Messages
L["MBF_ERR1"] = "저장소에서 버튼 제거 중 오류 발생"
L["MBF_ERR2"] = "그것은 MinimapButtonFrame에서만 버튼을 제거할 수 있습니다."
L["MBF_ERR3"] = "저장소에서 숨겨진 버튼 제거 중 오류 발생."
L["MBF_ERR4"] = "추가할 수 없음. 보호되었거나 이미 등록됨!"
L["MBF_ERR5"] = "저장소에서 하위 이벤트 제거 중 오류 발생."
L["MBF_ERR6"] = "버튼을 추가할 준비가 안되었음. 다시 시도하세요."
L["MBF_ERR7"] = "버튼 또는 개체가 존재하지 않습니다."

-- Chat commands
L["MBF"] = true
L["usage"] = "사용법"
L["Version"] = "버전"
L["info"] = "정보"
L["show"] = "표시"
L["hide"] = "숨김"
L["reload"] = "새로 고침"
L["help"] = "도움말"
L["debug"] = "디버그"
L["config"] = "설정"
L["remove"] = "삭제"
L["add"] = "추가"
L["MBF_SLASH_Detail1"] = "사용법 /mbf [ 추가 | 제거 | 정보 | 설정 | 표시 | 숨김 | 새로 고침 | 도움말 ] ";
L["MBF_SLASH_Detail2"] = "추가 - 자동으로 수집되지 않은 버튼을 창에 추가";
L["MBF_SLASH_Detail3"] = "제거 - 창에서 수집된 버튼을 제거";
L["MBF_SLASH_Detail4"] = "정보 - 커서 아래의 개체에 대한 정보를 표시";
L["MBF_SLASH_Detail5"] = "설정 - 설정창을 화면에 표시";
L["MBF_SLASH_Detail6"] = "표시 - 주 MBF를 화면에 표시";
L["MBF_SLASH_Detail7"] = "숨김 - 텍스처를 다시 적용합니다. 검은 색 아이콘이 수정됩니다.";
L["MBF_SLASH_Detail8"] = "새로 고침  -  텍스처를 다시 적용합니다. 검은 색 아이콘이 수정됩니다.";
L["MBF_SLASH_Detail9"] = "도움말 - 정보와 명령어 도움말을 표시";

-- Display Info
L["Unnamed Object"] = "이름없는 개체";
L["Unknown Object Type"] = "알 수 없는 개체 유형";
L["Object Type"] = "개체 유형";
L["Parent"] = "상위";
L["Unknown Parent Name"] = "상위 이름을 알 수 없음";
L["No Parent"] = "상위 없음";
L["Children"] = "하위"

-- Display Options
L["Display"] = "화면"
L["Display Settings"] = "화면 설정"

L["Button Text"] = "단추 텍스트"
L["BUTTONTEXT_DESC"] = "버튼을 표시 할 텍스트"

L["Locked"] = "고정"
L["LOCKED_DESC"] = "MBF 프레임의 고정 여부를 전환합니다."

L["dragLocked"] = "움직임 잠금"
L["DRAGLOCKED_DESC="] = "버튼과 프레임이 이동되지 않도록하십시오." 

L["Hide when Locked"] = "고정 시 숨김"
L["HIDELOCKED_DESC"] = "프레임이 고정되면 프레임의 일부분이 숨겨지게 됩니다."

L["ALTTITLE_DESC"] = "Alt 제목 바 위치"
L["ALTTITLEDESC_DESC"] = "기본 상단 또는 좌측보다 하단 또는 우측으로 제목 바를 이동합니다."

L["Buttonskin"] = "버튼 무늬"
L["BUTTONSKIN_DESC"] = "버튼 프레임의 무늬를 선택합니다."

L["Background Color"] = "배경 색상"
L["COLOR_DESC"] = "MBF의 배경 색상을 선택합니다."

L["Columns or Rows"] = "행 또는 열"
L["CLR_DESC"] = "행 또는 열의 숫자를 표시합니다."

L["MBF Anchor"] = "닻"
L["MBFANCHOR_DESC"] = "모서리는 프레임에서 성장할 것이다."

L["Top Left"] = "탑 왼쪽"
L["Top Right"] = "오른쪽 상단"
L["Bottom Left"] = "왼쪽 아래"
L["Bottom Right"] = "오른쪽 하단"

L["Padding"] = "간격"
L["PADDING_DESC"] = "버튼 사이에 얼마 만큼의 간격."

L["Opacity"] = "투명도"
L["OPACITY_DESC"] = "프레임의 투명도를 설정합니다."

L["Scale"] = "크기"
L["SCALE_DESC"] = "프레임의 크기를 설정합니다."

L["Name"] = "이름"
L["Nothing"] = "없음"
L["Border"] = "테두리"
L["Background"] = "배경"
L["All"] = "모두"

L["Blizzard"] = "블리자드"
L["Blizzard Square"] = "블리자드 사각"

-- Gathering Options

L["Gathering"] = "수집"
L["Gathering Settings"] = "수집 설정"

L["GATHERHEAD1_DESC"] = "MBF 미니맵 버튼 설정"
L["GATHERDESC1_DESC"] = "MBF 미니맵 버튼에 대해 설정합니다."

L["Show Minimap Button"] = "미니맵 버튼 표시"
L["SHOWBUTTON_DESC"] = "MBF 미니맵 버튼을 표시합니다."

L["Collect Button"] = "버튼 수집"
L["COLLECT1_DESC"] = "MBF 미니맵 버튼을 수집합니다."

L["GATHERHEAD2_DESC"] = "블리자드 미니맵 버튼 설정"
L["GATHERDESC2_DESC"] = "블리자드 미니맵 버튼에 대해 설정합니다."

L["Collect Buttons"] = "버튼 수집"
L["COLLECT2_DESC"] = "블리자드 미니맵 버튼을 수집합니다."

L["Exclude Queue Button"] = "대기열 버튼을 제외"
L["ExcludeLFG_DESC"] = "대기열 상태 버튼을 제외"

L["Hide Mail"] = "우편 숨김"
L["HIDEMAIL_DESC"] = "블리자드 새로운 우편 아이콘을 숨김"

L["Show No Mail Icon"] = "우편 없음 아이콘 표시"
L["NOMAIL_DESC"] = "당신이 가진 우편이 없으면 우편 없음 아이콘을 표시함."

L["Hide Tracking"] = "추적 숨김"
L["TRACKING_DESC"] = "블리자드 추적 버튼을 숨김"

L["Hide Voice Chat"] = "음성 대화 숨김"
L["VOICECHAT_DESC"] = "블리자드 음성 대화 버튼 숨김"

L["Hide Calendar"] = "달력 숨김"
L["CALENDAR_DESC"] = "블리자드 달력 아이콘 숨김"

L["Hide Zoom Buttons"] = "줌 버튼 숨김"
L["ZOOM_DESC"] = "블리자드 미니맵 줌 버튼 숨김"

L["Hide World Map"] = "세계 지도 숨김"
L["WORLDMAP_DESC"] = "블리자드 세계 지도 버튼 숨김"

-- Exceptions Options

L["Exceptions"] = "제외"
L["Exceptions Settings"] = "제외 설정"

L["Protected Items"] = "보호 제품"
L["ICONSDESC_DESC"] = "잘못 항목을 모았습니다. 전 .. 채취 노드, 사용자 인터페이스 항목이없습니다."

L["CURRENTEXCEPTIONS_DESC"] = "현재 보호 항목이없습니다."

L["Remove"] = "제거"
L["ICONREMOVE_DESC"] = "선택된 보호된 항목을 제거합니다."

L["ICONADDTITLE_DESC"] = "보호된 항목 추가"
L["ICONADD_DESC"] = "상품의 일반적인 이름은 보호되어야합니다."

L["Button Override"] = "버튼 무시"
L["OVERRIDEDESC_DESC"] = "MBF가 인식하는 버튼은 미니맵 아이콘이지만 실제 버튼입니다."

L["Current Button Overrides"] = "현재 버튼 무시"

L["OVERRIDEREMOVE_DESC"] = "제외에서 선택된 버튼 무시를 제거"

L["Add Button Override"] = "버튼 무시 추가"
L["OVERRIDEADD_DESC"] = "버튼의 정확한 이름은 버튼 무시 영역에 추가됩니다."

-- Sorting Options

L["Sorting"] = "정렬"
L["Sorting Settings"] = "정렬 설정"

L["Sort By Rows"] = "열 기준 정렬"
L["SBR_DESC"] = "미니맵 버튼의 MBF 정렬 방향을 변경합니다."

L["Grow Buttons Up"] = "성장 버튼 위로"
L["GROWUP_DESC"] = "채우고 바닥부터 버튼 프레임."

L["Sort Order"] = "정렬 순서"
L["SORTORDER_DESC"] = "선택한 순서로 미니맵 버튼이 정렬됨"

L["Alphabetical"] = "알파벳 순서"
L["Blizzard First"]  = "블리자드 처음"
L["Blizzard Last"]  = "블리자드 끝"
L["Custom"]  = "사용자 정의"

L["UP"] = "위로"
L["DOWN"] = "아래로"
L["UP_DESC"] = "선택된 미니맵 버튼의 순서를 위로 이동"
L["DOWN_DESC"] = "선택된 미니맵 버튼의 순서를 아래로 이동"

-- Profile Options

L["Profiles"] = "프로필"
