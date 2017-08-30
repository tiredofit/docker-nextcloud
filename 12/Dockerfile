FROM tiredofit/nginx-php-fpm:7.1-latest
ARG NEXTCLOUD_VERSION=12.0.2
ARG GPG_nextcloud="2880 6A87 8AE4 23A2 8372  792E D758 99B9 A724 937A"

ENV CRON_PERIOD=15 \
    DB_TYPE=sqlite3 \
    PHP_ENABLE_FILEINFO=TRUE \
    PHP_ENABLE_PCNTL=TRUE \
    PHP_ENABLE_POSIX=TRUE \
    PHP_ENABLE_SIMPLEXML=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    PHP_ENABLE_ZIP=TRUE

RUN apk -U upgrade && \
    apk add -t nextcloud-dependencies \
        autoconf \
        automake \
        build-base \
        libtool \
        gnupg \
        pcre-dev \
        php7-dev \
        php7-pear \
        samba-dev \
        tar && \
 
    apk add \
        ca-certificates \
        coreutils \
        findutils \
        libressl \
        libsmbclient \
        rsync \
        sudo \
        && \
 
    pecl install \
         smbclient && \
    
    echo "extension=smbclient.so" > /etc/php7/conf.d/00_smbclient.ini && \

### Nextcloud Installation
    mkdir -p /assets/nextcloud && \
    cd /tmp && \   
    NEXTCLOUD_SRC="nextcloud-${NEXTCLOUD_VERSION}.tar.bz2" && \
    wget -q https://download.nextcloud.com/server/releases/${NEXTCLOUD_SRC} && \
    wget -q https://download.nextcloud.com/server/releases/${NEXTCLOUD_SRC}.sha512 && \
    wget -q https://download.nextcloud.com/server/releases/${NEXTCLOUD_SRC}.asc && \
    wget -q https://nextcloud.com/nextcloud.asc && \
   
    echo "Verifying both integrity and authenticity of ${NEXTCLOUD_SRC}..." && \
    CHECKSUM_STATE=$(echo -n $(sha512sum -c ${NEXTCLOUD_SRC}.sha512) | tail -c 2) && \
    if [ "${CHECKSUM_STATE}" != "OK" ]; then echo "Warning! Checksum does not match!" && exit 1; fi && \
    
    gpg --import nextcloud.asc && \
    FINGERPRINT="$(LANG=C gpg --verify ${NEXTCLOUD_SRC}.asc ${NEXTCLOUD_SRC} 2>&1 | sed -n "s#Primary key fingerprint: \(.*\)#\1#p")" && \
    if [ -z "${FINGERPRINT}" ]; then echo "Warning! Invalid GPG signature!" && exit 1; fi && \
    if [ "${FINGERPRINT}" != "${GPG_nextcloud}" ]; then echo "Warning! Wrong GPG fingerprint!" && exit 1; fi && \
    echo "All seems good, now unpacking ${NEXTCLOUD_SRC}..." && \
    tar xjf ${NEXTCLOUD_SRC} --strip 1 -C /assets/nextcloud && \
    mkdir -p /assets/nextcloud/custom-apps && \
    rm -rf /tmp/* && \

## Maintenance
    update-ca-certificates && \

## Cleanup
    apk del nextcloud-dependencies && \
    rm -rf /var/cache/apk/* /usr/src/* /root/.gnupg

### Add Files
  ADD install /
