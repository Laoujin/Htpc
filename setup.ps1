# HTPC Initialization
# Creates some files & folders for a quick start

if (Test-Path '.env' -PathType Leaf) {
    Write-Host ".env file already existed, not touching" -ForegroundColor DarkMagenta
} else {
    cp .env-example .env
    Write-Host "Created .env file : Please configure before starting :)" -ForegroundColor DarkMagenta
}



$dir = mkdir config -ErrorAction SilentlyContinue
$dir = mkdir config/heimdall -ErrorAction SilentlyContinue
$dir = mkdir config/sonarr -ErrorAction SilentlyContinue
$dir = mkdir config/radarr -ErrorAction SilentlyContinue
$dir = mkdir config/prowlarr -ErrorAction SilentlyContinue
$dir = mkdir config/transmission -ErrorAction SilentlyContinue
$dir = mkdir config/bazarr -ErrorAction SilentlyContinue
$dir = mkdir config/jellyfin -ErrorAction SilentlyContinue
$dir = mkdir config/ombi -ErrorAction SilentlyContinue
$dir = mkdir config/readarr -ErrorAction SilentlyContinue
$dir = mkdir config/watchtower -ErrorAction SilentlyContinue


$dir = mkdir htpc -ErrorAction SilentlyContinue
$dir = mkdir htpc/downloads -ErrorAction SilentlyContinue
$dir = mkdir htpc/downloads/blackhole -ErrorAction SilentlyContinue
$dir = mkdir htpc/movies -ErrorAction SilentlyContinue
$dir = mkdir htpc/series -ErrorAction SilentlyContinue
$dir = mkdir htpc/books -ErrorAction SilentlyContinue
$dir = mkdir htpc/youtube -ErrorAction SilentlyContinue
$dir = mkdir htpc/backup -ErrorAction SilentlyContinue



Write-Host "Config folders created!"
Write-Host "This folder should NOT be in a folder synced by Dropbox, GDrive, ... " -ForegroundColor DarkMagenta
Write-Host "Especially the sqlite db of Radarr can get corrupted this way!!!" -ForegroundColor DarkMagenta
Write-Host ""
Write-Host "To spin up after configuration:" -ForegroundColor Green
Write-Host "docker-compose up -d" -ForegroundColor Green
