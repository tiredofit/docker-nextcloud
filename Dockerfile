ARG PHP_BASE=8.3
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG NEXTCLOUD_VERSION
ARG NEXTCLOUD_FILES_BACKEND_VERSION

ENV NEXTCLOUD_VERSION=${NEXTCLOUD_VERSION:-"29.0.4"} \
    NEXTCLOUD_FILES_BACKEND_VERSION=${NEXTCLOUD_FILES_BACKEND_VERSION:-"v0.7.0"} \
    NEXTCLOUD_FILES_BACKEND_REPO_URL=${NEXTCLOUD_FILES_BACKEND_REPO_URL:-"https://github.com/nextcloud/notify_push"} \
    DLIB_VERSION=v19.24.4 \
    DLIB_REPO_URL=https://github.com/davisking/dlib \
    PDLIB_VERSION=v1.1.0 \
    PDLIB_REPO_URL=https://github.com/goodspb/pdlib \
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
    PHP_ENABLE_PDLIB=TRUE \
    PHP_ENABLE_PDO=TRUE \
    PHP_ENABLE_PDO_SQLITE=TRUE \
    PHP_ENABLE_PDO_PGSQL=TRUE \
    PHP_ENABLE_POSIX=TRUE \
    PHP_ENABLE_PGSQL=TRUE \
    PHP_ENABLE_REDIS=TRUE \
    PHP_ENABLE_SIMPLEXML=TRUE \
    PHP_ENABLE_SODIUM=TRUE \
    PHP_ENABLE_SQLITE3=TRUE \
    PHP_ENABLE_SYSVSEM=TRUE \
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
    package install .dlib-build-deps \
                        build-base \
                        cmake \
                        git \
                        libjpeg-turbo-dev \
                        libpng-dev \
                        libx11-dev \
                        openblas-dev \
                        samurai \
                        && \
    package install .pdlib-build-deps \
                        php${PHP_BASE/./}-dev \
                        && \
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
                        imagemagick-heic \
                        libedit \
                        libmcrypt \
                        libreoffice \
                        libsmbclient \
                        libwebp \
                        libxml2 \
                        libzip \
                        ocrmypdf \
                        openblas \
                        openldap-clients \
                        openssl \
                        p7zip \
                        pcre \
                        rsync \
                        samba-client \
                        sqlite \
                        zlib \
        #                unrar \
                        && \
    \
    clone_git_repo "${DLIB_REPO_URL}" "${DLIB_VERSION}" && \
    cmake \
            -B build \
            -G Ninja \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DBUILD_SHARED_LIBS=ON \
            -DCMAKE_BUILD_TYPE=None \
            && \
    cmake --build build && \
    cmake --install build && \
    case "${PHP_BASE}" in \
        8.3 ) export php_folder="83" ;; \
        8.2 ) export php_folder="82" ;; \
        8.1 ) export php_folder="81" ;; \
        *) export php_folder=${PHP_BASE:0:1} ;; \
    esac ; \
    clone_git_repo ${PDLIB_REPO_URL} "${PDLIB_VERSION}" && \
    phpize${PHP_BASE/./} && \
    ./configure \
                --prefix=/usr \
                --with-php-config=php-config${PHP_BASE/./} \
                && \
	make -j $(nproc) && \
    make install && \
    echo "extension=pdlib" > /etc/php${php_folder}/mods-available/pdlib.ini && \
    echo ";priority=20" >> /etc/php${php_folder}/mods-available/pdlib.ini && \
    mkdir -p /assets/nextcloud/custom-apps && \
    if [[ "${NEXTCLOUD_VERSION}" =~ beta|pre|rc ]]; then \
        _nextcloud_release_prefix=prereleases ; \
    else \
        _nextcloud_release_prefix=releases ; \
    fi ; \
    curl -sSL https://download.nextcloud.com/server/${_nextcloud_release_prefix}/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /assets/nextcloud && \
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
    package remove .dlib-build-deps \
                   .pdlib-build-deps \
                   && \
    package cleanup && \
    rm -rf \
            /usr/src/*

COPY install /
