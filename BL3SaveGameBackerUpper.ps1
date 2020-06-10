# Version 0.02
# Created by T. Pettijohn on 2020-06-09
# Modified by T.Pettijohn on 2020-06-10
# GNU GPL v2


# Logic for creating backup names and creating the backup archive
function Backup-SaveGames {
    $BackupName = (Get-Date).ToString("D-yyyyMMdd_24T-HHmmss")+".zip"
    $BackupDest = ($BackupLoc + $BackupName)
    Compress-Archive -Path $SaveLoc -DestinationPath $BackupDest -CompressionLevel Optimal
    Write-Host "Backup $BackupName was created."
    }

# Logic for restoring previous saves
Function Restore-SaveGames {
    $LastBackup = (Get-ChildItem -Path $BackupLoc | Sort LastWriteTime | Select -Last 1)
    $RestoreSource = ($BackupLoc + $LastBackup)
    Expand-Archive -Path $RestoreSource -DestinationPath $RestoreLoc -Force
    }

# Prepping Variables
$SaveLoc = "$ENV:USERPROFILE\Documents\My Games\Borderlands 3\Saved\SaveGames\" # Change this if you do not use the default save location
$BackupLoc = "$ENV:USERPROFILE\Documents\BL3 Backups\" # Change this if you want to backup to a different location
$RestoreLoc = "$ENV:USERPROFILE\Documents\My Games\Borderlands 3\Saved\" # Change this to match the SaveLoc variable, just one directory higher

# Check for save game location; Prompt for input if not found.
If (Test-Path $SaveLoc){
    Write-Host "Save Game location detected!"
    }
Else {
    Write-Error "Did not detect Save Game location.."
    Start-Sleep -S 3
    Exit
    }

# Check for backup location; Create it if needed.
If (Test-Path $BackupLoc){
    Write-Host "Backup location detected!"
    }
Else {
    Write-Error "Did not detect Backup location... Creating directory to use..."
    New-Item -Path $BackupLoc -ItemType Directory
    }

Clear-Host

# Prompt user for input
$Choice = (Read-Host "Do you want to back up or restore? (B/R)")

# Backup Section
If ($Choice -ieq "B"){ 
Write-Host ("Running the Borderlands 3 Save Game Backer Upper. Press Ctrl + C to quit.")
    While($True){
        Backup-SaveGames
        Start-Sleep -S (60*15)
    }
}

# Restore Section
ElseIf ($Choice -ieq "R"){
    Restore-SaveGames
}

# Input catch
Else {
    Write-Error "Sorry, you pressed the wrong button."
    Exit
    }
