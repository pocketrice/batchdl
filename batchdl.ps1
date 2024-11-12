 [CmdletBinding(DefaultParameterSetName='Encode')]

param (
  [string]$bf
  [string]$d
  [switch]$help
  [switch]$s
)

if ($help) {

} else {
try {
  if (-not $bf) {
    $urls = @()

    while ($true) {
      write-host "Input URLs... (press ENTER to end)" -backgroundcolor "Blue"
      $input = read-host
      if ($input -eq "") { break }
      $urls += $input
    }

    write-host "Processing..." -backgroundcolor "Magenta"

    foreach ($url in $urls) {
      yt-dlp $url
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
