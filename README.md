Docker
=====
To be able to run Docker without sudo follow the 
Required Steps:
- create the group "docker" from the ui or cli (sudo synogroup --add docker)
- make it the group of the docker.sock: sudo chown root:docker /var/run/docker.sock
- assign the user to the docker group in the ui or cli (sudo synogroup --member docker {username})
- login into ssh as {username} and try (if you were already logged in before you created the group, logout and relogin)


Media
=====

```ps1
cp .env-example .env
docker-compose -d up
docker-compose down
```




configuration:
- config & torrent-blackhole --> in dropbox/working/htpc --> magnets don't work for Transmission blackhole
- downloads in m:\downloads


Radarr:
- Movies list
  - Add manual search button (open in modal)
  - Filters: remove "All". Group others so that missing/monitored etc can be combined + Missing + Downloaded
  - Filtering on "In Cinemas": no date is highest date etc
  - Profile tooltip with the accepted criteria & cutoff
  - Title: on hover add details icon and show details in modal
- Add movie
  - Add button to show more details like (Trakt, IMDB links & score)
- Details page
  - Cache search results of a manual search
- Activity
  - Filter on text?
- Manual import modal
  - Browse: Start path in downloads folder



Sonarr:
- Manual Import
  - Make one modal to update series, season & episode
  - Free text search
  - Update multiple records for series & season
- Settings > Quality: alternative edit mode with numeric input?


Jellyfin:
- Filers: Add button to save as default settings
- 




Also need Watchtower for automatic updates
https://github.com/Monitorr/Monitorr (sites up/down?)

Also need something to monitor all access & logs?
Monitoring: https://www.netdata.cloud/

--> list suggestions?
https://github.com/faulander/P4S


```bash
# get PUID & PGID
id

# TZ list:
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
```

### Sonarr

admin/sonarrIsGoingToBeAwesome

e8c50afebad84563893519b9e23c91aa

```
docker run -id \
  --name=htpc-sonarr \
  --restart=always \
  -p 8989:8989 \
  -e PUID=1026 \
  -e PGID=100 \
  -v /volume1/Media/Sonarr/rtc:/dev/rtc:ro \
  -v /volume1/Media/Sonarr/config:/config \
  -v /volume1/Media/Series:/tv \
  -v /volume1/Media/Htpc/downloads:/downloads \
  --dns 8.8.8.8 \
  linuxserver/sonarr
```

### Radarr

admin / radarrIsGoingToBeAwesome

```
docker run -id \
  --name=htpc-radarr2 \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Europe/Brussels \
  -p 7878:7878 \
  -v /volume1/Media/Sonarr/radarr-config:/config \
  -v /volume1/Media/Movies:/movies \
  -v /volume1/Media/Htpc/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/radarr
```

  --dns 8.8.8.8 \

### Download Client

Deluge? rTorrent+Flood? qTorrent?
AriaNg -- replacement for transmission poor ui?

- `/combustion-release/`: Super basic & super confusing
- `/transmission-web-control/`: Old school Torrent Client UI but has the most functionality - by far.
- `/kettu/`: Super basic but looks good

```
docker run -id \
  --name=htpc-transmission2 \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Europe/Brussels \
  -e TRANSMISSION_WEB_HOME=/transmission-web-control/ \
  -e USER=admin \
  -e PASS=ohMyTransmission \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /volume1/Media/Htpc/config/transmission:/config \
  -v /volume1/Media/Htpc/downloads:/downloads \
  -v /volume1/Media/Htpc/torrent-blackhole:/watch \
  --restart unless-stopped \
  linuxserver/transmission
```

--dns 8.8.8.8 \

docker run --dns 192.168.1.4 --network VLAN1-pihole busybox nslookup google.com
docker run --dns 1.1.1.1 busybox nslookup google.com


docker run --dns 172.17.0.7 busybox nslookup google.com


### Indexer

https://www.reddit.com/r/trackers/wiki/getting_into_private_trackers


Pwd: sonarrIsGoingToBeAwesome
API Key: snyg2vw03wjfhbdosggb5u1m5setwd2n

Get an OMDB free key: http://www.omdbapi.com/apikey.aspx
(and fill it in in Jackett)

```
docker run -id \
  --name=htpc-jackett \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Europe/Brussels \
  -e AUTO_UPDATE=true \
  -p 9117:9117 \
  -v /volume1/Media/Htpc/config/jackett:/config \
  -v /volume1/Media/Htpc/torrent-blackhole:/downloads \
  --restart unless-stopped \
  --dns 8.8.8.8 \
  linuxserver/jackett
```


### Subtitles

Or: subliminal? (There is a SynoPackage)
Or: Periscope?

admin / ohMyBazarr


```
docker run -id \
  --name=htpc-bazarr \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Europe/Brussels \
  -p 6767:6767 \
  -v /volume1/Media/Htpc/config/bazarr:/config \
  -v /volume1/Media/Movies:/movies \
  -v /volume1/Media/Series:/tv \
  --restart unless-stopped \
  --dns 8.8.8.8 \
  linuxserver/bazarr
```


### Jellyfin


Use Traefik instead of nginx?
https://github.com/containous/traefik
https://blog.linuxserver.io/2018/02/03/using-traefik-as-a-reverse-proxy-with-docker/

https://jellyfin.org/docs/general/networking/nginx.html

Needed for more format support? https://github.com/tvheadend/tvheadend


admin / ohMyJellyfin


[Open Subtitles](https://github.com/jellyfin/jellyfin-plugin-opensubtitles)
[Playback Reporting](https://github.com/jellyfin/jellyfin-plugin-playbackreporting)
https://github.com/jellyfin/jellyfin-plugin-reports




```
docker run -id \
  --name=htpc-jellyfin \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Europe/Brussels \
  -p 8096:8096 \
  -p 8920:8920 \
  -v /volume1/Media/Htpc/config/jellyfin:/config \
  -v /volume1/Media/Series:/data/tvshows \
  -v /volume1/Media/Movies:/data/movies \
  --restart unless-stopped \
  linuxserver/jellyfin
```

```
# Not in use:
  
  -v /opt/vc/lib:/opt/vc/lib `#optional` \
  --device /dev/dri:/dev/dri `#optional` \
  --device /dev/vcsm:/dev/vcsm `#optional` \
  --device /dev/vchiq:/dev/vchiq `#optional` \
  --device /dev/video10:/dev/video10 `#optional` \
  --device /dev/video11:/dev/video11 `#optional` \
  --device /dev/video12:/dev/video12 `#optional` \
```


### Lists


https://github.com/l3uddz/traktarr
https://github.com/sjlu/popular-movies




https://api.radarr.video/v2/imdb/list?listId=ur6239814
https://www.imdb.com/list/ls085729609/


#### Ombi

admin / ohMyOmbi

```
docker run -id \
  --name=htpc-ombi \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Europe/Brussels \
  -p 3579:3579 \
  -v /volume1/Media/Htpc/config/ombi:/config \
  --restart unless-stopped \
  --dns 8.8.8.8 \
  linuxserver/ombi
```


  --network VLAN1-pihole \


https://development.robinwinslow.uk/2016/06/23/fix-docker-networking-dns/

docker run --dns 8.8.8.8 busybox nslookup google.com
docker run --dns 192.168.1.4 --network VLAN1-pihole busybox nslookup google.com
