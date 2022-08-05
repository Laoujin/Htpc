# Htpc Docker

Fork from a friend. docker-compose for a media center maintainer.
Combination of Sonarr, Radarr, Bazarr, Jackett and Transmission. 

## Sonarr

```
docker run -id \
  --name=htpc-sonarr \
  --restart=always \
  -e PUID=10XX \
  -e PGID=10X \
  -e TZ=Europe/Brussels \
  -p 8989:8989 \
  -v /volume1/Media/Sonarr/rtc:/dev/rtc:ro \
  -v /[PATH-TO-CONFIG]:/config \
  -v /[PATH-TO]/Series:/tv \
  -v /[PATH-TO]/downloads:/downloads \
  linuxserver/sonarr
```

## Radarr

```
docker run -id \
  --name=htpc-radarr2 \
  -e PUID=10XX \
  -e PGID=10X \
  -e TZ=Europe/Brussels \
  -p 7878:7878 \
  -v /[PATH-TO-CONFIG]:/config \
  -v /[PATH-TO]/Movies:/movies \
  -v /[PATH-TO]/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/radarr
```

## Bazarr

```
docker run -id \
  --name=htpc-bazarr \
  -e PUID=10XX \
  -e PGID=10X \
  -e TZ=Europe/Brussels \
  -p 6767:6767 \
  -v /[PATH-TO-CONFIG]:/config \
  -v /[PATH-TO-Movies]:/movies \
  -v /[PATH-TO-Series]:/tv \
  --restart unless-stopped \
 linuxserver/bazarr
```

## Prowlarr

```
```

## Transmission

```
docker run -id \
  --name=htpc-transmission2 \
  -e PUID=10XX \
  -e PGID=10X \
  -e TZ=Europe/Brussels \
  -e TRANSMISSION_WEB_HOME=/transmission-web-control/ \
  -e USER=admin \
  -e PASS=ohMyTransmission \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /[PATH-TO-CONFIG]:/config \
  -v /[PATH-TO]/downloads:/downloads \
  -v /[PATH-TO]/blackhole:/watch \
  --restart unless-stopped \
  linuxserver/transmission
```

