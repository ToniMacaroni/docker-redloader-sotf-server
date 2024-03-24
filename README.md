# Redloader - Modded Sons Of The Forest dedicated server (docker)

The images are tagged with the according Redloader version (starting from 0.7.0)

Bash:

```console
docker run --rm -i -t -p 8766:8766/udp -p 27016:27016/udp -p 9700:9700/udp -v $(pwd)/steamcmd:/steamcmd -v $(pwd)/game:/sonsoftheforest --name docker-redloader-sotf-server tonimacaroniy/docker-redloader-sotf-server:0.7.0
```
or using docker-compose:
```yaml
version: '3.9'
services:
  docker-redloader-sotf-server:
    container_name: docker-redloader-sotf-server
    image: tonimacaroniy/docker-redloader-sotf-server:0.7.0
    restart: always
    environment:
      ALWAYS_UPDATE_ON_START: 1
    ports:
      - 8766:8766/udp
      - 27016:27016/udp
      - 9700:9700/udp
    volumes:
      - ./steamcmd:/steamcmd
      - ./game:/sonsoftheforest
      - ./winedata:/winedata
```
```console
docker-compose up
```

## Software used

- Debian Slim Stable
- Xvfb
- Winbind
- Wine
- SteamCMD
- SonsOfTheForest Dedicated Server (APP-ID: 2465200)

## Credits
https://github.com/jammsen/docker-sons-of-the-forest-dedicated-server
