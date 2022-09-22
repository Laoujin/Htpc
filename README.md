Htpc
====

```ps1
cp .env-example .env
docker-compose up -d
docker-compose stop
```

## Documentation

- [Servarr Wiki](https://wiki.servarr.com)
- [Trash Guides](https://trash-guides.info)

## Hardware Acceleration

https://www.forum-nas.fr/viewtopic.php?f=56&t=14012

```
chmod 777 /dev/dri/renderD128 # Perhaps not necessary?
```

Or we could transcode unplayable videos:
jlesage/handbrake or jlesage/mkvtoolnix

## Inspiration

https://github.com/sjlu/popular-movies

YoutubeDL:
javascript:!function(){fetch("http://pongit:8885/youtube-dl/q",{body:new URLSearchParams({url:window.location.href,format:"bestvideo"}),method:"POST"})}();

https://github.com/l3uddz/traktarr



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
