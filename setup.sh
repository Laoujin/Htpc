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
mkdir $configPath/bazarr -v
mkdir $configPath/jellyfin -v
mkdir $configPath/ombi -v
mkdir $configPath/readarr -v
mkdir $configPath/watchtower -v


echo "Where do you want to put all media DATA?"
read dataPath
mkdir $dataPath
mkdir $dataPath/downloads -v
mkdir $dataPath/downloads/blackhole -v
mkdir $dataPath/movies -v
mkdir $dataPath/series -v
mkdir $dataPath/books -v
mkdir $dataPath/youtube -v


echo "Creating .env"
cp .env-example .env -v
sed -i "s|^DATA_PATH=.*$|DATA_PATH=$dataPath|" .env
sed -i "s|^CONFIG_PATH=.*$|CONFIG_PATH=$configPath|" .env

echo "You may want to look at further configuring .env"
echo "If there are something containers you don't want, remove them from docker-compose.yml"
echo ""
echo "And then:"
echo "docker-compose up -d"
