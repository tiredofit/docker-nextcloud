FROM docker.io/tiredofit/nginx-php-fpm:8.1
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV NEXTCLOUD_VERSION=25.0.0rc5 \
    NEXTCLOUD_FILES_BACKEND_VERSION=0.4.0 \
    NGINX_SITE_ENABLED=nextcloud \
    NGINX_WEBROOT="/www/nextcloud" \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_BCMATH=TRUE \
    PHP_ENABLE_EXIF=TRUE \
    PHP_ENABLE_FILEINFO=TRUE \
    PHP_ENABLE_FTP=TRUE \
    #PHP_ENABLE_GEARMAN=TRUE \
    PHP_ENABLE_GMP=TRUE \
    PHP_ENABLE_IMAGICK=TRUE \
    PHP_ENABLE_IGBINARY=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_PCNTL=TRUE \
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
    CONTAINER_NAME=nextcloud-app \
    IMAGE_NAME="tiredofit/nextcloud:25" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-nextcloud/"

RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .nextcloud-run-dependencies \
                c-client \
                coreutils \
                ffmpeg \
                findutils \
                freetype \
                gd \
                ghostscript \
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
                ocrmypdf \
                openldap-clients \
                p7zip \
                pcre \
                rsync \
                samba-client \
                sqlite \
#                unrar \
                zlib \
                && \
            \
### Nextcloud Installation
    mkdir -p /assets/nextcloud/custom-apps && \
    #curl -sSL https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /assets/nextcloud && \
    curl -sSL https://download.nextcloud.com/server/prereleases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /assets/nextcloud && \
    chown -R nginx:www-data /assets/nextcloud && \
    \
    mkdir -p /opt/nextcloud_files_backend && \
    curl -ssL https://github.com/nextcloud/notify_push/releases/download/v${NEXTCLOUD_FILES_BACKEND_VERSION}/notify_push.tar.gz | tar xvfz - --strip 1 -C /opt/nextcloud_files_backend && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /opt/nextcloud_files_backend && \
    ##
    mkdir -p /data/userdata && \
    touch /data/userdata/audit.log && \
    touch /data/userdata/flow.log && \
    touch /data/userdata/nextcloud.log && \
    \
    ## Cleanup
    rm -rf /var/cache/apk/*

### Add Files
ADD install /
