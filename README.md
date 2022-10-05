Htpc
====

## Getting Started

```ps1
# Create some init files
./setup.ps1

# Configure .env & docker-compose-yml

# Start & Stop
docker-compose up -d
docker-compose stop
```

### Save/Load 

In case the internet connection is too slow, ask for an USB stick with the Docker images.

```
docker save -o heimedall.tar linuxserver/heimdall
docker load -i "heimdall.tar"
```

## Documentation

- [Servarr Wiki](https://wiki.servarr.com)
- [Trash Guides](https://trash-guides.info)
- [LinuxServer Fleet](https://fleet.linuxserver.io)
- [SmartHome Beginner](https://www.smarthomebeginner.com)
- [File Quality](https://trash-guides.info/Radarr/Radarr-Quality-Settings-File-Size/)

## Hardware Acceleration

https://www.forum-nas.fr/viewtopic.php?f=56&t=14012

```
chmod 777 /dev/dri/renderD128 # Perhaps not necessary?
```

Or we could transcode unplayable videos:
jlesage/handbrake or jlesage/mkvtoolnix

## Inspiration

YoutubeDL:
javascript:!function(){fetch("http://pongit:8885/youtube-dl/q",{body:new URLSearchParams({url:window.location.href,format:"bestvideo"}),method:"POST"})}();


## Open Source Contributions

Stuff I'd like to have...


Jellyfin:
- Filers: Add button to save as default settings
- Subtitles:
  - When a subtitle extends over length of movie, it never disappears
  - When stopping playback while subtitle is displayed, it never disappears
- Chromecast
  - Can't play all movie formats
  - The overlay displayed at the bottom at the beginning of a movie often never goes away
