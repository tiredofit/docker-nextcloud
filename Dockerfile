ARG PHP_BASE=8.1
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG NEXTCLOUD_VERSION
ARG NEXTCLOUD_FILES_BACKEND_VERSION

ENV NEXTCLOUD_VERSION=${NEXTCLOUD_VERSION:-"25.0.8"} \
    NEXTCLOUD_FILES_BACKEND_VERSION=${NEXTCLOUD_FILES_BACKEND_VERSION:-"v0.6.3"} \
    NEXTCLOUD_FILES_BACKEND_REPO_URL=${NEXTCLOUD_FILES_BACKEND_REPO_URL:-"https://github.com/nextcloud/notify_push"} \
    NGINX_CLIENT_BODY_TIMEOUT=600 \
    NGINX_CLIENT_BODY_BUFFER_SIZE=512k \
    NGINX_FASTCGI_BUFFERS="64 4k" \
    NGINX_KEEP_ALIVE_TIMEOUT=600 \
    NGINX_SEND_TIMEOUT=600 \
    NGINX_SITE_ENABLED=nextcloud \
    NGINX_WEBROOT="/www/nextcloud" \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_BCMATH=TRUE \
    PHP_ENABLE_EXIF=TRUE \
    PHP_ENABLE_FILEINFO=TRUE \
    PHP_ENABLE_FTP=TRUE \
    PHP_ENABLE_GMP=TRUE \
    PHP_ENABLE_IMAGICK=TRUE \
    PHP_ENABLE_IGBINARY=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_MSGPACK=TRUE \
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
    PHP_TIMEOUT=600 \
    CONTAINER_NAME=nextcloud-app \
    IMAGE_NAME="tiredofit/nextcloud" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-nextcloud/"

RUN source /assets/functions/00-container && \
    set -x && \
    package update && \
    package upgrade && \
    package install .nextcloud-run-dependencies \
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
    mkdir -p /assets/nextcloud/custom-apps && \
    curl -sSL https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /assets/nextcloud && \
    #curl -sSL https://download.nextcloud.com/server/prereleases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /assets/nextcloud && \
    chown -R nginx:www-data /assets/nextcloud && \
    \
    mkdir -p /opt/nextcloud_files_backend/bin/x86_64 && \
    curl -sSL "${NEXTCLOUD_FILES_BACKEND_REPO_URL}"/releases/download/${NEXTCLOUD_FILES_BACKEND_VERSION}/notify_push-x86_64-unknown-linux-musl -o /opt/nextcloud_files_backend/bin/x86_64/notify_push && \
    mkdir -p /opt/nextcloud_files_backend/bin/armv7 && \
    curl -sSL "${NEXTCLOUD_FILES_BACKEND_REPO_URL}"/releases/download/${NEXTCLOUD_FILES_BACKEND_VERSION}/notify_push-armv7-unknown-linux-musleabihf  -o /opt/nextcloud_files_backend/bin/armv7/notify_push && \
    mkdir -p /opt/nextcloud_files_backend/bin/aarch64 && \
    curl -sSL "${NEXTCLOUD_FILES_BACKEND_REPO_URL}"/releases/download/${NEXTCLOUD_FILES_BACKEND_VERSION}/notify_push-aarch64-unknown-linux-musl  -o /opt/nextcloud_files_backend/bin/aarch64/notify_push && \
    chmod +x /opt/nextcloud_files_backend/bin/*/notify_push && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /opt/nextcloud_files_backend && \
    \
    mkdir -p /data/userdata && \
    touch /data/userdata/audit.log && \
    touch /data/userdata/flow.log && \
    touch /data/userdata/nextcloud.log && \
    \
    package cleanup && \
    rm -rf \
            /usr/src/*

COPY install /
