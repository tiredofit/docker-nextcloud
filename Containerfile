# SPDX-FileCopyrightText: © 2026 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG \
    BASE_IMAGE

FROM ${BASE_IMAGE}

LABEL \
        org.opencontainers.image.title="Nextcloud" \
        org.opencontainers.image.description="Groupware Platform" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/nextcloud" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-nextcloud/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-nextcloud.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"

ARG \
    NEXTCLOUD_VERSION="35.0.0rc4" \
    NEXTCLOUD_FILES_BACKEND_VERSION="v1.4.0" \
    NEXTCLOUD_FILES_BACKEND_REPO_URL="https://github.com/nextcloud/notify_push" \
    DLIB_VERSION="v20.0.1" \
    DLIB_REPO_URL="https://github.com/davisking/dlib" \
    PDLIB_VERSION="v1.1.0" \
    PDLIB_REPO_URL="https://github.com/goodspb/pdlib"

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

ENV \
    IMAGE_NAME="nfrastack/nextcloud" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-nextcloud/"

RUN echo "" && \
    BUILD_ENV=" \
                30-nextcloud/NEXTCLOUD_USER=[env:NGINX_USER] \
                30-nextcloud/NEXTCLOUD_GROUP=[env:NGINX_GROUP] \
                10-nginx/NGINX_SITE_ENABLED=nextcloud \
                10-nginx/NGINX_SITE_NEXTCLOUD_WEBROOT=/www/nextcloud \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_01_NAME='Referrer-Policy' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_01_VALUE='no-referrer' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_01_FLAG='always' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_02_NAME='X-Content-Type-Options' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_02_VALUE='nosniff' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_02_FLAG='always' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_03_NAME='X-Frame-Options' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_03_VALUE='SAMEORIGIN' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_03_FLAG='always' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_04_NAME='X-Permitted-Cross-Domain-Policies' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_04_VALUE='none' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_04_FLAG='always' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_05_NAME='X-Robots-Tag' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_05_VALUE='noindex, nofollow' \
                10-nginx/NGINX_SITE_NEXTCLOUD_HEADER_05_FLAG='always' \
                10-nginx/NGINX_SITE_NEXTCLOUD_INDEX_FILE='/index.php\$request_uri' \
                20-php-fpm/PHP_CREATE_SAMPLE_PHP=FALSE \
                20-php-fpm/PHP_MEMORY_LIMIT=512M \
                20-php-fpm/PHP_MODULE_ENABLE_BCMATH=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_EXIF=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_FILEINFO=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_FTP=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_GMP=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_IMAGICK=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_IGBINARY=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_LDAP=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_MSGPACK=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_PCNTL=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_PDLIB=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_PDO=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_PDO_SQLITE=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_PDO_PGSQL=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_POSIX=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_PGSQL=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_REDIS=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_SIMPLEXML=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_SODIUM=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_SQLITE3=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_SYSVSEM=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_XMLWRITER=TRUE \
                20-php-fpm/PHP_MODULE_ENABLE_ZIP=TRUE \
                20-php-fpm/PHP_MODULE_OPCACHE_INTERNED_STRINGS_BUFFER=16 \
                20-php-fpm/PHP_MODULE_OPCACHE_MEM_SIZE=256M \
                20-php-fpm/PHP_TIMEOUT=600 \
              " \
              && \
    DLIB_BUILD_DEPS_ALPINE=" \
                                build-base \
                                cmake \
                                ffmpeg-dev \
                                git \
                                libjpeg-turbo-dev \
                                libjxl-dev \
                                libpng-dev \
                                libx11-dev \
                                openblas-dev \
                                samurai \
                            " \
                            && \
    PDLIB_BUILD_DEPS_ALPINE=" \
                                php$(php-ext info base_alt)-dev \
                            " \
                            && \
    NEXTCLOUD_RUN_DEPS_ALPINE=" \
                                c-client \
                                coreutils \
                                ffmpeg \
                                findutils \
                                freetype \
                                gd \
                                ghostscript \
                                gmp \
                                icu \
                                imagemagick-jxl \
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
                              " \
                              && \
    \
    source /container/base/functions/container/build && \
    container_build_log image && \
    create_user nextcloud 1000 nextcloud 1000 && \
    add_user_group nextcloud www-data && \
    package update && \
    package upgrade && \
    package install \
                        DLIB_BUILD_DEPS \
                        NEXTCLOUD_RUN_DEPS \
                        PDLIB_BUILD_DEPS \
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
    container_build_log add "Dlib" "${DLIB_VERSION}" "${DLIB_REPO_URL}" && \
    \
    clone_git_repo ${PDLIB_REPO_URL} "${PDLIB_VERSION}" && \
    phpize${PHP_BASE/./} && \
    ./configure \
                --prefix=/usr \
                --with-php-config=php-config$(php-ext info base_alt) \
                && \
    make -j $(nproc) && \
    make install && \
    echo "extension=pdlib" > "$(php-ext info modules_path)"/pdlib.ini && \
    echo ";priority=20" >> "$(php-ext info modules_path)"/pdlib.ini && \
    container_build_log add "Pdlib" "${PDLIB_VERSION}" "${PDLIB_REPO_URL}" && \
    php-ext prepare && \
    php-ext reset && \
    php-ext enable core && \
    if [[ "${NEXTCLOUD_VERSION}" =~ beta|pre|rc ]]; then \
        nrp=prer ; \
    else \
        nrp=r ; \
    fi ; \
    mkdir -p /container/data/nextcloud/install/custom-apps && \
    curl -sSL https://download.nextcloud.com/server/${nrp}eleases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 | tar xvfj - --strip 1 -C /container/data/nextcloud/install && \
    chown -R "${NGINX_USER}":"${NGINX_GROUP}" /container/data/nextcloud/install && \
    container_build_log add "Nextcloud" "${NEXTCLOUD_VERSION}" "download.nextcloud.com" && \
    \
    mkdir -p /opt/notify_push/bin/ && \
    chown -R "${NGINX_USER}":"${NGINX_GROUP}" /opt/notify_push && \
    curl -sSL "${NEXTCLOUD_FILES_BACKEND_REPO_URL}"/releases/download/${NEXTCLOUD_FILES_BACKEND_VERSION}/notify_push-$(container_info arch)-unknown-linux-musl -o /opt/notify_push/bin/notify_push && \
    chmod +x /opt/notify_push/bin/notify_push && \
    container_build_log add "Notify Push" "${NEXTCLOUD_FILES_BACKEND_VERSION}" "${NEXTCLOUD_FILES_BACKEND_REPO_URL}" && \
    \
    package remove \
                    DLIB_BUILD_DEPS \
                    PDLIB_BUILD_DEPS \
                    && \
    package cleanup

COPY rootfs /
