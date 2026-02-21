 [CmdletBinding(DefaultParameterSetName='Encode')]

param (
  [string]$bf,
  [string]$d,
  [switch]$h,
  [switch]$s,
  [switch]$m
)

if ($h) {
   write-host ""
   write-host "***************************************************************"
   write-host "usage: batchdl [-sm] [-d target_directory] [-bf batchfile]"
   write-host ""
   write-host "s(ound) to chime when done!"
   write-host "m(p3) to save as audio!"
   write-host "***************************************************************"
   write-host ""
} else {
try {
  if (-not $bf) {
    $urls = @()

    if ($m) {
	write-host "*** SAVING AS MP3 ***" -backgroundcolor "Blue"
    } else {
	write-host "*** SAVING AS VIDEO ***" -backgroundcolor "Blue"
    }

    while ($true) {
      write-host "Input URLs... (press ENTER to end)" -backgroundcolor "Blue"
      $input = read-host
      if ($input -eq "") { break }
      $urls += $input
    }

    write-host "Processing..." -backgroundcolor "Magenta"

    foreach ($url in $urls) {
      if ($m) {
       yt-dlp -x --audio-format mp3 --audio-quality 0 --no-playlist $url
      } else {
       yt-dlp $url
      }
    }
  }
  else {
    write-host "Processing..." -backgroundcolor "Magenta"
    Get-Content $bf | ForEach-Object {
      yt-dlp $_
    }
  }

  write-host "Done!!" -backgroundcolor "Cyan"

  if ($s) {
    [console]::Beep(529.63, 800)
    [console]::Beep(441.63, 800)
    [console]::Beep(529.63, 800)
    [console]::Beep(441.63, 800)
    [console]::Beep(529.63, 800)
    [console]::Beep(441.63, 800)
  }
} catch {
  write-host "Something bad happened... check your input format." -backgroundcolor "Red"
  $Error[0]
}
}
