# Redloader - Modded Sons Of The Forest dedicated server (docker)

Bash:

```console
docker run --rm -i -t -p 8766:8766/udp -p 27016:27016/udp -p 9700:9700/udp -v $(pwd)/steamcmd:/steamcmd -v $(pwd)/game:/sonsoftheforest --name sons-of-the-forest-dedicated-server jammsen/sons-of-the-forest-dedicated-server:latest
```
or using docker-compose:
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
