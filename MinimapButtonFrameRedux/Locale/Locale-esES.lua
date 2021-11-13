local L = LibStub("AceLocale-3.0"):NewLocale("Minimap Button Frame", "esES")
if not L then return end

-- Bindings
BINDING_HEADER_MBF_SEP = "Minimapa botón Frame"
BINDING_NAME_MBF_CONFIG = "Cambiar configuración"
BINDING_NAME_MBF_TOGGLE = "Cambiar MBF"
BINDING_NAME_MBF_ADD = "Añadir Button"
BINDING_NAME_MBF_REMOVE = "Eliminar Botón"

-- Tooltips
L["ADDON"] = "Minimap Button Frame"
L["No New Mail"] = "No tienes mensajes nuevos"
L["MBF_LDB_TOOLTIP"] = "|cff1eff00Izquierda Haga Clic|r aquí para Mostrar/Ocultar el marco\n|cff1eff00Shift Clic|r para ver la pantalla de configuración"
L["MBF_TOOLTIP_FULL"] = "|cff1eff00Izquierda Haga Clic|r aquí para Mostrar/Ocultar el marco\n|cff1eff00Shift Clic|r para ver la pantalla de configuración\n|cff1eff00Haga clic derecho + arrastrar|r para mover el botón"
L["MBF_TOOLTIP_SMALL"] = "|cff1eff00Shift clic|r para ver la pantalla de configuración"
L["MBF_TOOLTIP_ROLLUP"] = "|cff1eff00Haga clic izquierdo + arrastrar|r para mover MBF\n|cff1eff00Haga clic derecho en|r a Mostrar / Ocultar el marco"

-- Error Messages
L["MBF_ERR1"] = "Error al eliminar Botón de Almacenamiento"
L["MBF_ERR2"] = "Sólo los botones de la MinimapButtonFrame puede quitarse de ella."
L["MBF_ERR3"] = "Error al eliminar Invisible Botón de almacenamiento."
L["MBF_ERR4"] = "No se puede añadir. No es un botón válido o ya incluidos!"
L["MBF_ERR5"] = "Error al eliminar Niño Eventos de almacenamiento."
L["MBF_ERR6"] = "Botón no estaba listo para ser añadido.  Por favor, inténtelo."
L["MBF_ERR7"] = "Botón o de objetos no existe."

-- Chat commands
L["MBF"] = true
L["usage"] = "Uso"
L["Version"] = true
L["info"] = true
L["show"] = "mostrar"
L["hide"] = "ocultar"
L["reload"] = "recargar"
L["help"] = "ayuda"
L["debug"] = true
L["config"] = true
L["remove"] = "eliminar"
L["add"] = "añadir"
L["MBF_SLASH_Detail1"] = "Uso / mbf [añadir | eliminar | info | config | mostrar | ocultar | recargar | ayuda] "
L["MBF_SLASH_Detail2"] = "añadir - añade un auto no se reunieron botón para el marco"
L["MBF_SLASH_Detail3"] = "eliminar - elimina un botón se reunieron el marco de"
L["MBF_SLASH_Detail4"] = "info - Muestra información sobre el objeto bajo el cursor"
L["MBF_SLASH_Detail5"] = "config - Muestra la pantalla de configuración."
L["MBF_SLASH_Detail6"] = "mostrar - Muestra la pantalla principal MBF"
L["MBF_SLASH_Detail7"] = "ocultar - Oculta la pantalla principal MBF."
L["MBF_SLASH_Detail8"] = "recargar - Vuelve a aplicar la textura. Esto corrige los iconos ennegrecidos."
L["MBF_SLASH_Detail9"] = "ayuda - Muestra comando ayuda e información"

-- Display Info
L["Unnamed Object"] = "Sin nombre del objeto"
L["Unknown Object Type"] = "Tipos de objeto desconocido"
L["Object Type"] = "Tipos de objeto"
L["Parent"] = "Padres"
L["Unknown Parent Name"] = "Nombre del Padre Desconocido"
L["No Parent"] = "No hay Padres"
L["Children"] = "Niños"

-- Display Options
L["Display"] = "Pantalla"
L["Display Settings"] = "Configuración de pantalla"

L["Button Text"] = "Botón de texto"
L["BUTTONTEXT_DESC"] = "Texto para mostrar en el botón"

L["Locked"] = "Cerrado"
L["LOCKED_DESC"] = "Alterna si la CSM marco está bloqueado." 

L["dragLocked"] = "Cerradura de movimiento" 
L["DRAGLOCKED_DESC="] = "Evite que el botón y el marco se muevan."

L["Hide when Locked"] = "Ocultar una vez cerradas"
L["HIDELOCKED_DESC"] = "¿Qué porción de la imagen debe estar oculto cuando el marco está bloqueado." 

L["ALTTITLE_DESC"] = "Otro título Localización Bar" 
L["ALTTITLEDESC_DESC"] = "Mover la barra de título para el fondo o lateral derecho en lugar de la Comienzo de la página por defecto o lateral izquierdo."

L["Buttonskin"] = "Botón de la piel"
L["BUTTONSKIN_DESC"] = "Elija la piel de los marcos en el botón."

L["Background Color"] = "Color de fondo"
L["COLOR_DESC"] = "Elige el color de fondo para la Caja." 

L["Columns or Rows"] = "Columnas o Filas"
L["CLR_DESC"] = "El número de filas o colomns muestra." 

L["MBF Anchor"] = "Ancla"
L["MBFANCHOR_DESC"] = "El rincón que la estructura pueda crecer a partir."

L["Top Left"] = "Izquierda Arriba"
L["Top Right"] = "Arriba a la derecha"
L["Bottom Left"] = "Izquierda inferior"
L["Bottom Right"] = "Parte inferior derecha"

L["Padding"] = "Relleno"
L["PADDING_DESC"] = "¿Cuánto de relleno entre los botones." 

L["Opacity"] = "Opacidad"
L["OPACITY_DESC"] = "Establecer la opacidad de la imagen." 

L["Scale"] = "Escala"
L["SCALE_DESC"] = "Establecer la escala de la imagen." 

L["Name"] = "Nombre"
L["Nothing"] = "Nada de lo Oculto"
L["Border"] = "Ocultar las fronteras"
L["Background"] = "Ocultar Antecedentes"
L["All"] = "Ocultar Tanto"

L["Blizzard"] = true
L["Blizzard Square"] = "Blizzard Cuadrado"

-- Gathering Options

L["Gathering"] = "Recolección"
L["Gathering Settings"] = "Recolección de Configuración"

L["GATHERHEAD1_DESC"] = "MBF minimapa botón Configuración" 
L["GATHERDESC1_DESC"] = "Ajustes de la MBF minimapa Botón" 

L["Show Minimap Button"] = "Mostrar Minimap Botón"
L["SHOWBUTTON_DESC"] = "Mostrar la MBF minimapa Botón."

L["Collect Button"] = "Recoger Botón"
L["COLLECT1_DESC"] = "Recoger la MBF minimapa Botón." 

L["GATHERHEAD2_DESC"] = "Blizzard minimapa botón Configuración" 
L["GATHERDESC2_DESC"] = "Configuración para el minimapa Blizzard Botones" 

L["Collect Buttons"] = "Recoger Botones"
L["COLLECT2_DESC"] = "Recoger el minimapa Blizzard Botones" 

L["Exclude Queue Button"] = "Excluir botón Cola"
L["ExcludeLFG_DESC"] = "Excluir el botón de estado de la cola"

L["Hide Mail"] = "Ocultar Icono de Correo"
L["HIDEMAIL_DESC"] = "Ocultar el icono de correo nuevo de Blizzard" 

L["Show No Mail Icon"] = "Mostrar icono de correo no"
L["NOMAIL_DESC"] = "Mostrar el icono de correo no cuando usted no tiene correo electrónico."

L["Hide Tracking"] = "Ocultar Botón de Seguimiento"
L["TRACKING_DESC"] = "Ocultar el Botón de Seguimiento de Blizzard" 

L["Hide Voice Chat"] = "Ocultar Chat de voz Botón"
L["VOICECHAT_DESC"] = "Ocultar el botón de chat de voz de Blizzard" 

L["Hide Calendar"] = "Ocultar el calendario" 
L["CALENDAR_DESC"] = "Ocultar el Calendario de Blizzard"

L["Hide Zoom Buttons"] = "Ocultar Minimap botones de zoom"
L["ZOOM_DESC"] = "Ocultar el minimapa Blizzard Zoom Botones" 

L["Hide World Map"] = "Ocultar Mapa del Mundo botón"
L["WORLDMAP_DESC"] = "Ocultar el botón de Blizzard World Map" 

-- Exceptions Options

L["Exceptions"] = "Excepciones" 
L["Exceptions Settings"] = "Configuración de las excepciones"

L["Protected Items"] = "Elementos protegidos"
L["ICONSDESC_DESC"] = "Incorrectamente objetos recogidos. ex .. Gatherer nodos, elementos de interfaz de usuario."

L["CURRENTEXCEPTIONS_DESC"] = "Actual elementos protegidos."

L["Remove"] = "Eliminar" 
L["ICONREMOVE_DESC"] = "Elimina el elemento seleccionado Protegidas." 

L["ICONADDTITLE_DESC"] = "Añadir Protegidas del artículo" 
L["ICONADD_DESC"] = "El nombre generalizada del artículo que debe protegerse."

L["Button Override"] = "Botón de Sobrescribir" 
L["OVERRIDEDESC_DESC"] = "Botones de la CSM se piensa minimapa iconos, pero son realmente los botones."

L["Current Button Overrides"] = "Botón Anula actual" 

L["OVERRIDEREMOVE_DESC"] = "Quita el botón seleccionado Sobreescribe de las excepciones" 

L["Add Button Override"] = "Añadir botón Sobrescribir"
L["OVERRIDEADD_DESC"] = "El nombre del botón que se añade a la tabla botón Sobrescribir."

-- Sorting Options

L["Sorting"] = "Clasificación" 
L["Sorting Settings"] = "Configuración de clasificación" 

L["Sort By Rows"] = "Ordenar por filas"
L["SBR_DESC"] = "Cambia la dirección de la Caja tipo minimapa botones."

L["Grow Buttons Up"] = "Crecer UP"
L["GROWUP_DESC"] = "Rellena el cuadro con los botones de abajo hacia arriba."

L["Sort Order"] = "Ordenar"
L["SORTORDER_DESC"] = "Elige el fin de que el minimapa botones están ordenados" 

L["Alphabetical"] = "Alfabéticamente"
L["Blizzard First"]  = "Blizz Primera"
L["Blizzard Last"]  = "Blizz Última"
L["Custom"]  = true

L["UP"] = "Arriba"
L["DOWN"] = "Abajo"
L["UP_DESC"] = "Mover, seleccione el botón del minimapa para arriba" 
L["DOWN_DESC"] = "Mover, seleccione el botón del minimapa para abajo"

-- Profile Options

L["Profiles"] = "Perfiles"
