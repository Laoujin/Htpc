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

Or we could transcode inplayable videos:
jlesage/handbrake or jlesage/mkvtoolnix

## Inspiration

https://github.com/sjlu/popular-movies

YoutubeDL:
javascript:!function(){fetch("http://pongit:8885/youtube-dl/q",{body:new URLSearchParams({url:window.location.href,format:"bestvideo"}),method:"POST"})}();

configuration:
- config & torrent-blackhole --> in dropbox/working/htpc --> magnets don't work for Transmission blackhole
- downloads in m:\downloads


https://github.com/l3uddz/traktarr



## Open Source Contributions

Stuff I'd like to have...

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
