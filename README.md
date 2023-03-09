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

## Watchtower on Windows

Open issue: https://github.com/containrrr/watchtower/issues/105


- Switch to `Switch to Windows containers...` in the Docker Desktop Windows tray menu
- Docker Desktop > Settings > Docker Engine > Set `{ "experimental": true }`
- Restart-Service docker

```sh
docker run mcr.microsoft.com/windows/servercore:ltsc2022

# Otherwise you'll get one of these errors:
> docker: no matching manifest for linux/amd64 in the manifest list entries.
> no matching manifest for windows/amd64 10.0.19044 in the manifest list entries (details: https://stackoverflow.com/questions/48066994/docker-no-matching-manifest-for-windows-amd64-in-the-manifest-list-entries)
```

And then use:  
https://github.com/visualon/docker-watchtower




## Documentation

- [Servarr Wiki](https://wiki.servarr.com)
- [Trash Guides](https://trash-guides.info)
- [LinuxServer Fleet](https://fleet.linuxserver.io)
- [SmartHome Beginner](https://www.smarthomebeginner.com)
- [File Quality](https://trash-guides.info/Radarr/Radarr-Quality-Settings-File-Size/)
