# BL3SaveGameBackerUpper
Borderlands 3 Save Game backup and restore tool

Super basic, rough draft, unoptimized, hacked together Powershell 5 script for automating Borderlands 3 Save Game backups and restores. 

Created to help with Save Game corruption that was causing lost characters. 

Works for default save game directory [C:\Users\username\Documents\My Games\Borderlands 3\Saved\SaveGames] 
Backs up to [C:\Users\username\Documents\BL3 Backups]

Creates a new ZIP archive of the entire Save Games directory every 15 minutes. 

Meant to be launched before starting BL3 to get a pre-session backup, and recommended to leave running throughout a session, 
so you can never lose more than 15 minutes of game time if a crash causes corrupt save files. 

If you do get a corrupt save, you can also use this to restore the most recent ZIP archive to get your character(s) back. 

If the most recent is still corrupt, you can navigate to the BL3 Backups directory, and delete the latest ZIP archive, 
then try restoring the next most recent. And so on, until you find a good one. 



Code is commented and uses long-typed CMDlets and variables, so is easy enough to read and modify.

If your saves aren't in default location, or if you want to backup your saves to a different location, 
feel free to fork and modify to your needs.



Only tested for Steam version of BL3.


TO DO:
Give it a basic GUI
Build menu to select which save game to restore
Build menu to clean up older save games
Optimize Code

