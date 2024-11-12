# batchdl
Quick n' dirty CLI tool for interfacing with yt-dlp for batch operations a tad bit quicker.

## Usage
`batchdl [-d target_directory] [-bf batchfile] [-s]`

The batchfile must be formatted in plaintext with URLs (can be individual videos or playlists) on consecutive lines — batchdl will go through each file and download them to your working directory (or target). Withholding -bf will prompt for successive entry of URLs until newline is entered (pasting from a properly formatted file permitted). The s(ound) flag will play a short pleasant chime upon completion of processing.

## Installation
_Requires yt-dlp to be installed._

Windows users: move `batchdl.ps1` to your designated PowerShell scripts folder (may need to add to $env:PATH at $profile).

Mac users: move `batchdl.sh` into your scripts folder (may need to add to $PATH).

Linux users: um tbd
