#!/usr/bin/env bash
echo "========"
echo "= HTPC ="
echo "========"
echo ""
echo "Current path: $(pwd)"
echo ""

echo "Where do you want to put all container CONFIGURATION?"
read configPath
mkdir $configPath -v
mkdir $configPath/heimdall -v
mkdir $configPath/sonarr -v
mkdir $configPath/sonarr-rtc -v
mkdir $configPath/radarr -v
mkdir $configPath/prowlarr -v
mkdir $configPath/transmission -v
mkdir $configPath/qbittorrent -v
mkdir $configPath/bazarr -v
mkdir $configPath/ombi -v
mkdir $configPath/jellyseerr -v
mkdir $configPath/jellystat-db -v
mkdir -p $configPath/jellystat/backup -v
mkdir $configPath/recyclarr -v


echo "Where do you want to put all media DATA?"
read dataPath
mkdir $dataPath
mkdir $dataPath/downloads -v
mkdir $dataPath/downloads/blackhole -v
mkdir $dataPath/movies -v
mkdir $dataPath/series -v


echo "Creating .env"
cp .env-example .env -v
sed -i "s|^DATA_PATH=.*$|DATA_PATH=$dataPath|" .env
sed -i "s|^CONFIG_PATH=.*$|CONFIG_PATH=$configPath|" .env

echo "Generating Jellystat secrets"
sed -i "s|^JELLYSTAT_JWT_SECRET=.*$|JELLYSTAT_JWT_SECRET=$(openssl rand -hex 32)|" .env
sed -i "s|^JELLYSTAT_DB_PASSWORD=.*$|JELLYSTAT_DB_PASSWORD=$(openssl rand -hex 24)|" .env

echo ""
echo "You may want to look at further configuring .env"
echo "Some containers overlap — pick one and remove the other from docker-compose.yml:"
echo "  download client : qBittorrent  (or Transmission)"
echo "  requests        : Jellyseerr   (or Ombi)"
echo "If there are containers you don't want, remove them from docker-compose.yml"
echo ""
echo "And then:"
echo "docker compose up -d"
