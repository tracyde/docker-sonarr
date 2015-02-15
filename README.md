# docker-sonarr
Docker container for (https://sonarr.tv/ "Sonarr") (previously NzbDrone)

## Build from docker file

```
git clone git@github.com:tracyde/docker-sonarr.git
cd docker-sonarr
docker build -t sonarr .
```

You can also obtain it via:

```
docker pull tracyde/sonarr
```

## Running:

### Ports
- **TCP 8989** - Web Interface

### Volumes
- **/config** - Sonarr configuration data
- **/data** - Completed downloads from download client
- **/media** - Sonarr media folder

```
docker run --restart="always" --name="sonarr" -h sonarr -p 8989:8989 -v /to/config/folder:/config -v /to/completed/downloads:/data -v /to/media:/media tracyde/sonarr
```
