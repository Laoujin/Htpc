Htpc
====


Startup with a dummy Heimdall:

```ps1
git checkout heimdall-windows
```


## Getting Started

```ps1
# One time in admin terminal
Set-ExecutionPolicy Unrestricted

# Create some init files/dirs
.\setup.ps1

# Configure .env & docker-compose-yml

# Start & Stop
docker-compose up -d
docker-compose stop
```

### Save/Load

In case the internet connection is too slow, ask for an USB stick with the Docker images.  
Also see `images-load.ps1` and `images-save.ps1`.

```ps1
docker save -o heimedall.tar linuxserver/heimdall
docker load -i "heimdall.tar"
```

## Documentation

- [Servarr Wiki](https://wiki.servarr.com)
- [Trash Guides](https://trash-guides.info)
- [LinuxServer Fleet](https://fleet.linuxserver.io)
- [SmartHome Beginner](https://www.smarthomebeginner.com)
- [File Quality](https://trash-guides.info/Radarr/Radarr-Quality-Settings-File-Size/)
