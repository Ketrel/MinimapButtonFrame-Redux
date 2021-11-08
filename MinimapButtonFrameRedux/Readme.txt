Minimap Button Frame v3.2.0 Readme.txt

Installation is the same as it is for most other WoW addons.  
Unpack the files to your  Worldofwarcraft/Interface/Addons   directory.


This addon will gather up most of your minimap addon buttons and put them into a movable frame.

If a button is not automatically gathered use the /mbf add command to attempt to gather it.
If you want to remove a button from the frame use the /mbf remove command to remove it.  
If you would like to return it to the frame just use /mbf add on the button.

MBF Will not gather buttons the do not have a name.  Currently I have only discovered two addons that create their minimap buttons this way.
OnRaid and Enchantrix.

Blizzard minimap buttons that are not always visible (Battleground, LFG) will only appear on the frame when they are normally shown.

Key Bindings can be setup for both add and remove as well as for hiding and showing the frame.

The Minimap Icons and Button Override settings are more advanced features.  
The Minimap Icons setting is for icons such as the nodes in GatherMate and gatherer that shouldn't be collected.
The Button Override is for buttons that will not gather automatically and a manual add gives the "Cannot add.  Protected or already included!" error.

Commands:

   /mbf			- displays the command line options in the chat frame
   /mbf add <button>	- adds a non gathered button to the frame.  <button> is optional.  
			  If it's not included then the item under the cursor will be gathered.
   /mbf remove <button> - removes a gathered button from the frame.  <button> is optional.  
			  If it's not included then the item under the cursor is removed.
   /mbf show		- shows the Main MBF Frame
   /mbf hide		- hides the Main MBF Frame
   /mbf info		- shows information about the object under the cursor
   /mbf config		- shows the configuration screen
   /mbf help		- shows command help and information

Minimap Button:

<Left-click>           - to show / hide the frame and all the buttons.
<Shift-click>          - to show the config screen.
<Right-click> and drag - to move the minimap button anywhere.


History


0.9  - 	Initial Release
0.9a - 	Fixed - Squeenix compatability.
0.9b - 	Fixed - the reason for many of the addon buttons not populating.
0.9c - 	Added - A Minimap button for the Addon.  It can be hidden through the config screen.
	Added - an option to hide the frame background when the frame is locked.
	Fixed - an Incompatibility with FishingBuddy.
0.9d - 	Added - option to collect Blizzard Minimap Buttons. (Requested feature)
	Added - Tooltip to minimap icon.
	Fixed - Gatherer Incompatibility.
	Fixed - Minimap button reappearing bug.
	Fixed - Locked / Background hiding weird issue.
	Change - Metamap temporary hack.
	Change - Moved default position of the minimap button. (Left side instead of right, but won't affect anyone who's already moved it.)
	Change - Options screen shown with double click instead of middle Click on the minimap button. 
	Change - Code improvements in preparation of add / remove functionality.
1.0  -  Added - Add / Remove functionality Implemented.  
		- To Add: Put your mouse over the button you want to add and type /mbf add
		- To Remove a button from the frame: put your mouse over the button and type /mbf remove
	Fixed - Blizz Buttons return to their places when the option to gather them is unchecked.
1.1  -  Added - Option to collect the MBF Button.
	Fixed - Some parent frames not hidden.
	Fixed - Party Member Frames not protected.
	Fixed - ZoomIn and ZoomOut Buttons were always collected.
	Fixed - MBF Button could be turned off with the frame hidden.
	Fixed - Issue with buttons not displaying correctly when returned to the minimap.
1.2  -  Added - Background Color changeable from the config screen
	Added - Small Title Frame shown when unlocked for ease of dragging
	Fixed - Another FrameLevel Issue
	Fixed - RecipeRadar Incompatibility
1.2a -  Fixed - Background Hidden when locked coloring issue
1.3  -  Added - All Minimap buttons should be the same size
	Added - Title Frame now contains the version number of MBF
	Fixed - Title Frame is the same color as the background
	Fixed - Many small potental Incompatabilities and code enhancements
1.3a -  Added - Buttons now always displayed in Alphabetical order
	Added - Extra space between the frame edge and the buttons
	Fixed - Show & Collect MBF button bug
	Fixed - Monkey Buddy Minimap Button Incompatibility
1.4  -  Added - FuBar and Titan Bar Support
1.5  -	Added - Active Scanning Option
	Added - Setable Key Bindings
	Fixed - No more holes when buttons disappear
	Fixed - FuBar Plugin Error
1.6  -	Added - Greyed out version of the mail icon to be displayed when the mail icon isn't shown and Blizz buttons are gathered
	Added - Minimap Button will snap to the minimap when it gets close and roll around it
	Fixed - Mail Icon now added to the frame with the rest of the blizzard minimap buttons
	Fixed - Several small bugs
	Change - Tooltip display improved
1.7  -  Added - Multiple Sort Selections
	Added - Redesigned Options Screen
	Added - Ability to hide most of the Blizzard Minimap Icons
	Fixed - Bigfoot Incompatability (Bigfoot is partially incompatable with MBF)
	Fixed - Keybind Error
1.7a -  Change - TOC Update
	Fixed - Gathermate Incompatability
	Fixed - Locked Color Issues
	Fixed - Minimap Button being dragged offscreen
	Fixed - Notes Minimap Button Incompatability Fixed
1.8  -  Added - Localized in English, Spanish, French, and German (Quick translations.  ie Google translation)
	Added - Button to reset addon to defaults on the config screen
	Change - Show / Hide command line options restored
	Change - Active Scanning on by default now
	Change - Gathering functionality improved
	Change - Increased the number of max buttons on a row/column to 50
	Change - Pause Active Scanning during combat to help with tainting.
	Change - Addon will actively hide the blizzard buttons if the option to hide it is selected.  No reappearing mail icon.
	Change - Removed the gray no mail icon.  (If there is enough demand I'll add it back.)
	Fixed - An Issue with the blizz buttons not reappearing when the button was unclicked
1.8a -	Fixed - An Issue with GameTimeFrame
	Fixed - Incompatibilites with:
		EastWestPlus
		Natur EnemyCastBar 8.7.5
		ChinChilla
		SmartMinimapZoom
		HandyNotes
1.9  - 	Added - Support for minimap Shapes other than round
	Added - Option to turn off the gray no mail icon
	Added - Right Clicking on the Drag button will now hide / show the main frame.
	Change - Gray no mail icon restored (Okay only one request and I had missed it, but you can turn it off now.)
	Fixed - All buttons should return to their original size, frameStrata and frameLevel when removed
	Fixed - Incompatability with Trinity Bars
	Fixed - Incompatability with Xparky
1.9a -  Change - zhCN and zhTW localization added.  Thank you 急云@CWDG
	Change - Restored some old code dealing with blocking of Pins and Notes and such.  Should hopefully fix many new incompatabilities that were discovered.
	Fixed - Incompatability with BasicMinimap
	Fixed - Incompatability with Notes
	Fixed - Incompatability with CT_RaidAssist
2.0b -  Added  - Modular Minimap Button skins (Square minimap buttons) (See Skinning.txt for more information)
	Added  - Korean localization
	Added  - Russian localization. Thank you StingerSoft
	Fixed  - Issues with DuckieBank, pMinimap, Bejeweled, and CallToArms
2.0b2 - Fixed  - Issue with EpicMusicPlayer
	Fixed  - Issue trying to restoreSettings that were nil
	Fixed  - Issue with savingSettings for things that didn't have a name (I shouldn't try to do it. lol)
	Change - Hid Invisible Button error message for Blizz Buttons.  Until I get this bug squashed.
2.0	Fixed  - Issue with stack overflow
	Fixed  - Now Compatable with WotLK
	Fixed  - WotLK button skinning issue
2.0a	Fixed  - Title Bar not hiding when locked
	Fixed  - Titan Panel Plugin
	Change - New German Localization.  Thank you cnbeefy
2.1	Fixed  - FuBar Plugin
	Fixed  - Lockup issue (I hope)
	Added  - Skin Pack - Not my graphics.  Props to all the original artists.
	Change - FuBar and Titan Panel addons are seperate addons.
2.2	Change - Removed Active Scanning Option.  This feature is always on now.
	Change - Removed the Set Defaults button.  It's not working at the moment and I wanted to get some fixes out there.
	Change - Moved Options screen to Blizzard Addon Options.
	Change - Main MBF options are now saved per account, the ignore, include, it's location, and the fubar settings are still saved per character
	Change - All Options should be reset to defaults with this version
	Change - New Korean Localization thank you Comace.
	Change - GuildOrganizer set to a standard Ignore due to incompatabilities.
	Change - Gather MBF Button Option disabled when MBF minimap Button not shown.
	Fixed  - Layering Issue with standard Blizzard bags
	Fixed  - Drag Button Text not scaling correctly.
	Fixed  - Incompatibility with Poisoner3, GuildMap3, and Karma
	Fixed  - Minimap Button Showing above blizzard bags.
2.2a	Fixed  - Issue with settings resetting every time.
2.3	Added  - LDB Plugin to replace TitanBar and FuBar Plugins
	Change - Restored pausing of Gathering during combat.
	Change - Nauticus minimap icon name change
	Change - Hid Invisible Button error again.
	Change - Rewrote Variable, and old button info storage handling.
	Change - Changed a couple of variables to save per char instead of per account.
	Change - TitanBar and FuBar Plugins removed.
	Fixed  - Issues with Wow++
	Fixed  - Issue with CraftNotes
2.3a	Fixed  - Issue with gathering of MBF Button
	Fixed  - Issue with not keeping the mail button hidden when the option is selected
	Fixed  - Included required lib that I had forgotten
	Added  - Command line manual adds and removes
2.4	Fixed  - Issue with Peggle
	Added  - Ability to add and remove buttons from the protected minimap Icon table (Minimap icons that get captured that aren't buttons Gatherer nodes, ect..)
	Added  - Ability to add and remove buttons from the override table (Buttons that have names similar to protected Icons, this allows them to be captured)
	Added  - Third Config Screen
3.0	New    - Redisigned Config Screens using Ace3
	Change - Drag Button is now a title bar on the shortest side of MBF, with an option for an alternate location
	New    - Now supports profiles
	New    - Custom sorting of the buttons on the frame	
3.0.1	Fixed  - Missing Library
3.0.2	Fixed  - Another missing Library
3.0.3	Fixed  - A typo in the Library Includes
3.0.4	Fixed  - A typo in the Localization
3.0.5	Fixed  - Minimap Button Option being disabled.
3.0.6	Change - Improved Korean and Russian translations - Thank you.  ckKid and Stingersoft respectively.
	Fixed  - Minimap Buttons returning to the minimap when the world map was opened.
	Fixed  - MBF text showing up when the Frame was locked and then the frame was hidden then shown.
3.0.7	Fixed  - MBF text showing up on login when it should have been hidden
	Fixed  - Mail Icon moving around when the world map was shown or the interface was hidden
3.0.8	Update - Toc updated for current wow version.
	Update - toc line added for Wowi Minion
3.0.9	Update - ToC Updated
	Fixed  - IsFrameType nil error
	Added  - New Skins from Jeffy162!  Thanks!
3.0.10	Fixed  - LFG Button Not collecting.
3.1.0	Fixed  - Initial Profile set to default by default  :)
	Fixed  - MinimapButtonFrame.lua:1332 error fixed
	New    - Added ability for the buttons to file the frame from the bottom up (Config:Sorting:Grow Buttons Up)
	New    - Added the ability to choose which corner the MBF frame is anchored at (Config:Display:MBF Anchor)
	Change - Sort by rows option moved to the Sorting section of the options
3.1.1	Fixed  - Updated Libraries
	Fixed  - Removed all references to arg1 and this
	Fixed  - getglobal and setglobal replaced with _G
3.1.2	Fixed  - Toc updated to 40000
	Fixed  - Typo preventing libdatabroker from being found
3.1.4	Fixed  - Black background hiding buttons properly this time
	Fixed  - Updated skinpack Toc to 40000
3.1.5	Update - Toc updated for current wow version
	Update - Added exceptions for Archy and EveryQuest Quest Givers.
	Update - New zhTW translation.  Thank you scars377!
	Change - Scanning now paused during combat lockdown.
3.1.10d Update - Toc updated for Warlords
	Update - Updated Libraries
3.1.10f Update - Added CrossRealmAssist button to exceptions
	Update - Changed handling of newMail icon.  Thanks HgD!	
3.1.12hm Update - Added command '/mbf reload' to re-apply the texture which fixes the black blobs in front of icons
         Update - Added option to Ctrl + Right Click the MBF button (while icons are showing) to do the equivalent of '/mbf reload'
3.2.0 Fixed - Shadowland fixes for setBackdrop

Known Incompatibilities / Bugs

	The MetaMap minimap button is incompatable because of the continual reseting of its position by the MetaMap addon.
	SexyMap must have all minimap icon control turned off for best results.  Though it still seems to mess with them.

	The addon is unable grab minmap buttons that do not have a name.
	Currently discovered addons that are this way are:

		Enchantrix 	( I have had a change request in with the developers for a while.  I don't think they're going to fix this. )
		onRaid


Future Features

	Ability to change the color of the border.
