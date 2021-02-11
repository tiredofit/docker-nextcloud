FROM tiredofit/nginx-php-fpm:7.4
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

ENV NEXTCLOUD_VERSION=20.0.7 \
    NGINX_WEBROOT="/www/nextcloud" \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_BCMATH=TRUE \
    PHP_ENABLE_FILEINFO=TRUE \
    PHP_ENABLE_GEARMAN=TRUE \
    PHP_ENABLE_GMP=TRUE \
    PHP_ENABLE_IMAGICK=TRUE \
    PHP_ENABLE_IGBINARY=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_PDO=TRUE \
    PHP_ENABLE_PDO_SQLITE=TRUE \
    PHP_ENABLE_PDO_PGSQL=TRUE \
    PHP_ENABLE_POSIX=TRUE \
    PHP_ENABLE_PGSQL=TRUE \
    PHP_ENABLE_REDIS=TRUE \
    PHP_ENABLE_SIMPLEXML=TRUE \
    PHP_ENABLE_SQLITE3=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    PHP_ENABLE_ZIP=TRUE \
    PHP_MEMORY_LIMIT="512M" \
    ZABBIX_HOSTNAME=nextcloud-app

RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .nextcloud-run-dependencies \
                bzip2-dev \
                c-client \
                coreutils \
                ffmpeg \
                findutils \
                freetype \
                gd \
                gmp \
                icu \
                imagemagick \
                libedit \
                openssl \
                libmcrypt \
                libreoffice \
                libsmbclient \
                libwebp \
                libxml2 \
                libzip \
                openldap \
                pcre \
                rsync \
                sqlite \
                zlib \
                && \
            \
### Nextcloud Installation
    mkdir -p /assets/nextcloud/custom-apps && \
    NEXTCLOUD_SRC="nextcloud-${NEXTCLOUD_VERSION}.tar.bz2" && \
    curl -ssL https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /assets/nextcloud && \
    chown -R nginx:www-data /assets/nextcloud && \
    \
## Cleanup
    rm -rf /var/cache/apk/*

### Add Files
ADD install /
