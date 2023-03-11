Htpc
====


Startup with a dummy Heimdall:

```ps1
git checkout heimdall-windows
```


## Getting Started

```ps1
# Create some init files
./setup.ps1

# Configure .env & docker-compose-yml

# Start & Stop
docker-compose up -d
docker-compose stop
```


## Documentation

- [Servarr Wiki](https://wiki.servarr.com)
- [Trash Guides](https://trash-guides.info)
- [LinuxServer Fleet](https://fleet.linuxserver.io)
- [SmartHome Beginner](https://www.smarthomebeginner.com)
- [File Quality](https://trash-guides.info/Radarr/Radarr-Quality-Settings-File-Size/)


## Inspiration

YoutubeDL:

```js
fetch("http://pongit:8885/youtube-dl/q", {
  body: new URLSearchParams({url:window.location.href,format:"bestvideo"}),
  method:"POST"
});
```
