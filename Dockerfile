FROM jammsen/base:wine-stable-debian-bullseye

LABEL org.opencontainers.image.authors="Sebastian Schmidt, ToniMacaroni"
LABEL org.opencontainers.image.source="https://github.com/ToniMacaroni/docker-redloader-sotf-server"

ENV WINEPREFIX=/winedata/WINE64 \
    WINEARCH=win64 \
    WINEDEBUG=-all \
    WINEDLLOVERRIDES="version=n,b" \
    DISPLAY=:1.0 \
    TIMEZONE=Europe/Berlin \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0 \
    ALWAYS_UPDATE_ON_START=1 \
    USERDATA_PATH=/sonsoftheforest/userdata \
    REDLOADER_VERSION="0.7.0"

VOLUME ["/sonsoftheforest", "/steamcmd", "/winedata"]

EXPOSE 8766/udp 27016/udp 9700/udp 

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends --no-install-suggests lib32gcc-s1 nano winbind xvfb unzip \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . ./

RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo $TIMEZONE > /etc/timezone \
    && chmod +x /usr/bin/steamcmdinstaller.sh /usr/bin/servermanager.sh

CMD ["servermanager.sh"]
