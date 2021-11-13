local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "ruRU")

if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
BINDING_NAME_MBF_CONFIG = "Переключить настройки"
BINDING_NAME_MBF_TOGGLE = "Переключить MBF"
BINDING_NAME_MBF_ADD = "Добавить кнопку"
BINDING_NAME_MBF_REMOVE = "Удалить кнопку"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "Новой почты - Нет"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00Левый-Клик|r - скрыть/показать фрейм\n|cff1eff00Shift-Клик|r - открыть окно настроек"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00Левый-Клик|r - скрыть/показать фрейм\n|cff1eff00Shift-Клик|r - открыть окно настроек\n|cff1eff00Правый-Клик + тащить|r - переместить кнопку"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift-Клик|r - открыть окно настроек"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00Левый-Клик + тащить|r - переместить MBF\n|cff1eff00Правый-клик|r - скрыть/показать фрейм"

-- Error Messages
L["MBF_ERR1"] = "Ошибка при удалении кнопку из хранилища"
L["MBF_ERR2"] = "Могут быть удалены только те кнопоки которые находятся в окне MBF."
L["MBF_ERR3"] = "Ошибка при удалении невидимых кнопок из хранилища."
L["MBF_ERR4"] = "Не удается добавить. Возможно иконки защищены или уже добавлены в MBF!"
L["MBF_ERR5"] = "Ошибка при удалении из хранилища."
L["MBF_ERR6"] = "Кнопка не готовы быть добавлены.  Попытайтесь."
L["MBF_ERR7"] = "Кнопка или объект не существует."

-- Chat commands
L["MBF"] = "MBF"
L["usage"] = "usage"
L["Version"] = "Version"
L["info"] = "info"
L["show"] = "show"
L["hide"] = "hide"
L["reload" ] = "reload"
L["help"] = "help"
L["debug"] = "debug"
L["config"] = "config"
L["remove"] = "remove"
L["add"] = "add"
L["MBF_SLASH_Detail1"] = "Используйте /mbf [ add | remove | info | config | show | hide | reload | help ] "
L["MBF_SLASH_Detail2"] = "add - добавить кнопку, пропущенную авто сбором"
L["MBF_SLASH_Detail3"] = "remove - удалить собранную кнопку из окна MBF"
L["MBF_SLASH_Detail4"] = "info - показать информацию об объекте под курсором"
L["MBF_SLASH_Detail5"] = "config - показывает окно настроек."
L["MBF_SLASH_Detail6"] = "show - показывает главное окно MBF."
L["MBF_SLASH_Detail7"] = "hide - скрывает главное окно MBF."
L["MBF_SLASH_Detail8"] = "reload - Повторно применяет текстуру. Это исправляет почерневшие значки."
L["MBF_SLASH_Detail9"] = "help - показывает помощб по камандам и информацию"

-- Display Info
L["Unnamed Object"] = "Безымянный объект"
L["Unknown Object Type"] = "Неизвестный тип объекта"
L["Object Type"] = "Тип объекта"
L["Parent"] = "Родитель"
L["Unknown Parent Name"] = "Неизвестное имя родителя"
L["No Parent"] = "Нет родителя"
L["Children"] = "Дети"

-- Display Options
L["Display"] = "Отображение"
L["Display Settings"] = "Настройка отображения."

L["Button Text"] = "Кнопка текста"
L["BUTTONTEXT_DESC"] = "Текст, чтобы показать на кнопке"

L["Locked"] = "Закрепить"
L["LOCKED_DESC"] = "Закрепляет\освобождает фрейм MBF."

L["dragLocked"] = "Движущийся замок"
L["DRAGLOCKED_DESC="] = "Предотвратить перемещение кнопки и рамы" 

L["Hide when Locked"] = "Скрыть при закреплении"
L["HIDELOCKED_DESC"] = "Часть фрейма будет скрыта при закреплении фрейма."

L["ALTTITLE_DESC"] = "Альт. позиция заглавия"
L["ALTTITLEDESC_DESC"] = "Перемещает заглавие вниз или в правую сторону вместо левой стороны в вверху."

L["Buttonskin"] = "Шкурки"
L["BUTTONSKIN_DESC"] = "Выбрать шкурки для фрейма кнопок."

L["Background Color"] = "Цвет фона"
L["COLOR_DESC"] = "Выбирает цвет фона MBF."

L["Columns or Rows"] = "Колонки или Ряды"
L["CLR_DESC"] = "Количества отображаемых столбцов или строк."

L["MBF Anchor"] = "Якорь"
L["MBFANCHOR_DESC"] = "Углу, что рама будет расти из."

L["Top Left"] = "Верхний левый"
L["Top Right"] = "Топ-Право"
L["Bottom Left"] = "Нижний левый"
L["Bottom Right"] = "Нижней правой"

L["Padding"] = "Промежуток"
L["PADDING_DESC"] = "Установка промежутка между кнопками."

L["Opacity"] = "Прозрачность"
L["OPACITY_DESC"] = "Установка прозрачности фрейма."

L["Scale"] = "Масштаб"
L["SCALE_DESC"] = "Установка масштаба фрейма."

L["Name"] = "Название"
L["Nothing"] = "Ничего"
L["Border"] = "Края"
L["Background"] = "Фон"
L["All"] = "Всё"

L["Blizzard"] = "Blizzard"
L["Blizzard Square"] = "Квадраты Blizzard"

-- Gathering Options

L["Gathering"] = "Сбор"
L["Gathering Settings"] = "Сбор Настройки"

L["GATHERHEAD1_DESC"] = "Настройки кнопки MBF"
L["GATHERDESC1_DESC"] = "Настройки для кнопки MBF у мини-карты"

L["Show Minimap Button"] = "Показ кнопку у мини-карты"
L["SHOWBUTTON_DESC"] = "Показать кнопку MBF у мини-карты."

L["Collect Button"] = "Собрать кнопку MBF"
L["COLLECT1_DESC"] = "Собирает кнопку MBF у мини-карты."

L["GATHERHEAD2_DESC"] = "Настройки кнопок Blizzard"
L["GATHERDESC2_DESC"] = "Настройки кнопок Blizzard у мини-карты."

L["Collect Buttons"] = "Собрать кнопки Blizzard"
L["COLLECT2_DESC"] = "Собирает кнопки Blizzard у мини-карты."

L["Exclude Queue Button"] = "Исключить очереди кнопки"
L["ExcludeLFG_DESC"] = "Исключить кнопки состояния очереди"

L["Hide Mail"] = "Скрыть иконку почты"
L["HIDEMAIL_DESC"] = "Скрыть иконку почты."

L["Show No Mail Icon"] = "Показать иконку почты"
L["NOMAIL_DESC"] = "Показывать иконку \"Нет Почта\", когда у вас нет почты."

L["Hide Tracking"] = "Скрыть кнопку выслеживаний"
L["TRACKING_DESC"] = "Скрывать кнопку отслеживания."

L["Hide Voice Chat"] = "Скрыть кнопку голосового чата"
L["VOICECHAT_DESC"] = "Скрывать кнопку голосового чата"

L["Hide Calendar"] = "Скрыть календарь"
L["CALENDAR_DESC"] = "Скрывать календарь"

L["Hide Zoom Buttons"] = "Скрыть кнопки масштаба"
L["ZOOM_DESC"] = "Скрывать кнопку кнопки масштабирования у мини-карты"

L["Hide World Map"] = "Скрыть кнопку карты мира"
L["WORLDMAP_DESC"] = "Скрывать кнопку карты мира"

-- Exceptions Options

L["Exceptions"] = "Исключения"
L["Exceptions Settings"] = "Настройки исключения"

L["Protected Items"] = "Защищенным статьям"
L["ICONSDESC_DESC"] = "Неправильно собранные элементы. EX .. Gatherer Узлы, UI элементы."

L["CURRENTEXCEPTIONS_DESC"] = "Текущие защищенных статей."

L["Remove"] = "Удалить"
L["ICONREMOVE_DESC"] = "Удаляет выбранный охраняемым элемент."

L["ICONADDTITLE_DESC"] = "Добавить охраняемым Пункт"
L["ICONADD_DESC"] = "Обобщенное название Пункт должен быть защищен."

L["Button Override"] = "Замена кнопки"
L["OVERRIDEDESC_DESC"] = "Кнопки MBF считается иконкой у мини-карты, но в действительности это кнопки."

L["Current Button Overrides"] = "Текущая замена кнопки"

L["OVERRIDEREMOVE_DESC"] = "Удаляет выбранную замена кнопки из исключения"

L["Add Button Override"] = "Добавить замену кнопки"
L["OVERRIDEADD_DESC"] = "Точное название кнопки для добавления в таблицу замены кнопок."

-- Sorting Options

L["Sorting"] = "Сортировка"
L["Sorting Settings"] = "Параметры сортировки"

L["Sort By Rows"] = "Сортировать по рядам"
L["SBR_DESC"] = "Изменения направления сортировки кнопкок."

L["Grow Buttons Up"] = "Кнопки расти вверх"
L["GROWUP_DESC"] = "Заполняет кадр с кнопками снизу вверх."

L["Sort Order"] = "Порядок сортировки"
L["SORTORDER_DESC"] = "Выбирает порядок сортировки кнопок."

L["Alphabetical"] = "По алфавиту"
L["Blizzard First"]  = "Сначало Blizz"
L["Blizzard Last"]  = "Потом Blizz"
L["Custom"]  = "Свой"

L["UP"] = "Вверх" 
L["DOWN"] = "Вниз"
L["UP_DESC"] = "Переместить выбранные кнопки вверх" 
L["DOWN_DESC"] = "Переместить выбранные кнопки вниз"

-- Profile Options

L["Profiles"] = "Профили"
