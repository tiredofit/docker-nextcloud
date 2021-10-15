# github.com/tiredofit/docker-nextcloud

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-nextcloud?style=flat-square)](https://github.com/tiredofit/docker-nextcloud/releases/latest)
[![Build Status](https://img.shields.io/github/workflow/status/tiredofit/docker-nextcloud/build?style=flat-square)](https://github.com/tiredofit/docker-nextcloud/actions?query=workflow%3Abuild)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/nextcloud.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/nextcloud/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/nextcloud.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/nextcloud/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)
## About

This will build a Dockerfile for [Nextcloud](https://nextcloud.com) - a web based groupware solution.

*    Includes fail2ban for bad authentication blocking
*    Includes Nextcloud Hi Performance Files Backend

## Maintainer

- [Dave Conroy][https://github.com/tiredofit]

## Table of Contents

- [Introduction](#introduction)
- [Authors](#authors)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Data-Volumes](#data-volumes)
  - [Environment Variables](#environment-variables)
  - [Networking](#networking)
- [Upgrading from the 2.x Series](#upgrading-from-the-2x-series)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

# Prerequisites and Assumptions
*  Assumes you are using some sort of SSL terminating reverse proxy such as:
   *  [Traefik](https://github.com/tiredofit/docker-traefik)
   *  [Nginx](https://github.com/jc21/nginx-proxy-manager)
   *  [Caddy](https://github.com/caddyserver/caddy)
   *
## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`
### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/nextcloud) and is the recommended method of installation.

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Version | Container OS | Tag       |
| ------- | ------------ | --------- |
| latest  | Alpine       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v6`, `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
- Make [networking ports](#networking) available for public access if necessary

**The first boot can take from 2 minutes - 5 minutes depending on your CPU to setup the proper schemas.**

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

*Upgrading from an earlier version of this image running Nextcloud 20 or earlier? See [Upgrading from the 2.x Series](#upgrading-from-the-2x-series)*

| Directory               | Description                              |
| ----------------------- | ---------------------------------------- |
| `/data/userdata`        | Nextcloud Data                           |
| `/www/nextcloud/config` | Nextcloud Configuration Directory        |
| `/data/apps`            | Custom Apps downloaded from Plugin Store |
| `/data/themes`          | Custom Themes Directory                  |
| `/data/cache`           | Cache Directory                          |
| `/data/tmp`             | Temporary Directory                      |
| `/data/templates/`      | Templates Directory                      |
| `/www/logs`             | Nginx / php-fpm / Nextcloud logfiles     |

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`,`nano`,`vim`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                         | Description                            |
| ------------------------------------------------------------- | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/)        | Customized Image based on Alpine Linux |
| [Nginx](https://github.com/tiredofit/docker-nginx/)           | Nginx webserver                        |
| [PHP-FPM](https://github.com/tiredofit/docker-nginx-php-fpm/) | PHP Interpreter                        |

If you there are features that you wish to override based on the defaults and for some reason the environment variables are not working, create a file called `custom.config.php` in your `data/config` directory

| Parameter        | Description                                                                                                         | Default   |
| ---------------- | ------------------------------------------------------------------------------------------------------------------- | --------- |
| `ADMIN_USER`     | Admin user e.g. `admin`                                                                                             |           |
| `ADMIN_PASS`     | Admin pass e.g. `password`                                                                                          |           |
| `DOMAIN`         | The Domain that this is configured for e.g. 'example.org'                                                           |           |
| `DB_TYPE`        | Set the DB_TYPE - e.g. `mysql`, `postgres`, `sqlite3`                                                               | `sqlite3` |
| `DB_HOST`        | Hostname of DB Server e.g. `nextcloud-db`                                                                           |           |
| `DB_NAME`        | Database name e.g. `nextcloud`                                                                                      |           |
| `DB_PORT`        | Database port e.g. `3306`                                                                                           |           |
| `DB_USER`        | Username for Database e.g. `nextcloud`                                                                              |           |
| `DB_PASS`        | Password for Database e.g. `password`                                                                               |           |
| `IFRAME_DOMAINS` | Comma seperated value of domains/hostnames you want to allow loading the site via an IFrame e.g. `site.example.com` |           |

This image automatically configures nextcloud with the following options as defined in [config.sample.php](https://github.com/nextcloud/server/blob/master/config/config.sample.php).

| Variable                           | Description                                               | Nextcloud Attribute                         | Default                          |
| ---------------------------------- | --------------------------------------------------------- | ------------------------------------------- | -------------------------------- |
| `ANIMATED_GIFS_MAX_FILESIZE`       | Max file size for Animated Gifs                           | `max_filesize_animated_gifs_public_sharing` | `10`                             |
| `CACHE_DIRECTORY`                  | Cache Directory (leave blank for default)                 | ``                                          |
| `CIPHER`                           | Encryption Cipher                                         | `cipher`                                    | `AES-256-CFB`                    |
| `DATA_DIRECTORY`                   | Data Directory                                            | `${NGINX_WEBROOT}/data`                     |
| `DEFAULT_APPLICATION`              | Default Application users see                             | `defaultapp`                                | `files`                          |
| `DEFAULT_LANGUAGE`                 | Default Language to Install                               | `default_language`                          | `en`                             |
| `DEFAULT_LOCALE`                   | Default Locale                                            | `default_locale`                            | `en_US`                          |
| `ENABLE_APP_CODE_CHECKER`          | Check for signatures on all code                          | `appcodechecker`                            | `TRUE`                           |
| `ENABLE_APP_STORE`                 | Enable App Store                                          | `appstoreenabled`                           | `TRUE`                           |
| `ENABLE_BRUTEFORCE_PROTECTION`     | Enable Brute Force Protection                             | `auth.bruteforce.protection.enabled`        | `TRUE`                           |
| `ENABLE_CHECK_WELLKNOWN`           | Enable .wellknown check in admin                          | `TRUE`                                      |
| `ENABLE_DISPLAY_NAME_CHANGE`       | Allow user to change name                                 | `allow_user_to_change_display_name`         | `TRUE`                           |
| `ENABLE_FILESYSTEM_CHECK_CHANGES`  | Check changes on Filesystem in Background                 | `filesystem_check_changes`                  | `FALSE`                          |
| `ENABLE_FILE_LOCKING`              | Enable File Locking                                       | `filelocking.enabled`                       | `TRUE`                           |
| `ENABLE_KNOWLEDGE_BASE`            | Enable Help Menu                                          | `knowledgebaseenabled`                      | `TRUE`                           |
| `ENABLE_LOGIN_FORM_AUTOCOMPLETE`   | Allow Autocomplete on Login Pages                         | `login_form_autocomplete`                   | `TRUE`                           |
| `ENABLE_LOG_QUERY`                 | Enable Logging DB Queries                                 | `log_query`                                 | `FALSE`                          |
| `ENABLE_MYSQL_UTF8MB4`             | Enable 4 byte strings for MariaDB                         | `mysql.utf8mb4`                             | `TRUE`                           |
| `ENABLE_PARTFILE_UPLOADS_STORAGE`  | Enable uploading .part files in same location             | `TRUE`                                      |
| `ENABLE_PREVIEWS`                  | Enable Document Previews                                  | `enable_previews`                           | `TRUE`                           |
| `ENABLE_SESSION_KEEPALIVE`         | Enable Keepalive sessions                                 | `session_keepalive`                         | `TRUE`                           |
| `ENABLE_SIGN_UP`                   | Allow Signups to Instance                                 | `simpleSignUpLink.shown`                    | `TRUE`                           |
| `ENABLE_SMTP_AUTHENTICATION`       | Enable SMTP Authentication                                | `mail_smtpauth`                             | `FALSE`                          |
| `ENABLE_TOKEN_AUTH_ENFORCED`       | Enforce logging in with Tokens for Clients                | `token_auth_enforced`                       | `FALSE`                          |
| `FILE_LOCKING_DEBUG`               | Debug File Locking                                        | `filelocking.debug`                         | `FALSE`                          |
| `FORCE_LANGUAGE`                   | Force Language                                            | `force_language`                            | `en`                             |
| `FORCE_LOCALE`                     | Force Locale                                              | `force_locale`                              | `en_US`                          |
| `HASHING_COST`                     | Performance Cost for Hashing                              | `hashingCost`                               | `10`                             |
| `LDAP_CLEANUP_INTERVAL`            | How many minutes to cleanup LDAP users                    | `ldapUserCleanupInterval`                   | `51`                             |
| `LOG_DATE_FORMAT`                  | Format for Date and Time in logs                          | `logdateformat`                             | `Y-m-d H:i:s`                    |
| `LOG_DIR`                          | Log Directory                                             | `logfile`                                   | `/www/logs/nextcloud`            |
| `LOG_FILE_AUDIT`                   | Audit Log file                                            | `audit.log`                                 |
| `LOG_FILE_FLOW`                    | Workflow Log File                                         | `flow.log`                                  |
| `LOG_LEVEL`                        | Log Level                                                 | `loglevel`                                  | `2`                              |
| `LOG_TIMEZONE`                     | Timezone for Logfile                                      | `logtimezone`                               | Container Timezone               |
| `OVERWRITE_HOST`                   | Override the hostname for URLs                            | `overwritehost`                             | ``                               |
| `OVERWRITE_PROTOCOL`               | Override the Protocol if behind proxy                     | `overwriteprotocol`                         | ``                               |
| `PREVIEW_MAX_X`                    | Maximum Pixels for Previews (X)                           | `preview_max_x`                             | `200`                            |
| `PREVIEW_MAX_Y`                    | Maximum Pixels for Previews (Y)                           | `preview_max_y`                             | `200`                            |
| `SHARE_FOLDER`                     | Change root path of all shares to users                   | `/`                                         |
| `SHARING_ENABLE_ACCEPT`            | Enable Sharing Acceptance features                        | `FALSE`                                     |
| `SHARING_ENABLE_MAIL`              | Enable Sharing Mail Notification                          | `TRUE`                                      |
| `SHARING_FORCE_ACCEPT`             | Force Sharing Acceptance features                         | `FALSE`                                     |
| `SHARING_MAX_AUTOCOMPLETE_RESULTS` | Maximum results returned when searching                   | `sharing.maxAutocompleteResults`            | `0`                              |
| `SHARING_MIN_SEARCHSTRING_LENGTH`  | How many characters to type before searching              | `sharing.minSearchStringLength`             | `2`                              |
| `SKELETON_DIRECTORY`               | What folder is copied to new users folders on first login | `skeletondirectory`                         | `${NGINX_WEBROOT}/core/skeleton` |
| `SMTP_AUTHENTICATION_TYPE`         | Type of SMTP Authentication                               | `mail_smtpauthtype`                         | `NONE`                           |
| `SMTP_DEBUG`                       | Debug SMTP activities                                     | `mail_smtpdebug`                            | `FALSE`                          |
| `SMTP_DOMAIN`                      | Email Domain for Outbound mail                            | `mail_domain`                               | `example.org`                    |
| `SMTP_FROM`                        | Account name for Outbound Email                           | `mail_from_address`                         | `noreply`                        |
| `SMTP_HOST`                        | Remote SMTP Host                                          | `mail_smtphost`                             | `postfix_relay`                  |
| `SMTP_PASS`                        | SMTP Password                                             | `mail_smtppassword`                         | ``                               |
| `SMTP_PORT`                        | SMTP Port                                                 | `mail_smtpport`                             | `25`                             |
| `SMTP_SECURE`                      | Set if SMTP is TLS/SSL encrypted                          | `mail_smtpsecure`                           | `FALSE`                          |
| `SMTP_SEND_PLAINTEXT_ONLY`         | Send Plaintext Email Only                                 | `mail_send_plaintext_only`                  | `FALSE`                          |
| `SMTP_TIMEOUT`                     | Timeout for SMTP connections                              | `mail_smtptimeout`                          | `10`                             |
| `SMTP_USER`                        | SMTP Username                                             | `mail_smtpname`                             | ``                               |
| `SORT_GROUPS_BY_NAME`              | Sort groups by name as opposed to most users              | `sort_groups_by_name`                       | `FALSE`                          |
| `TRASHBIN_RETENTION`               | How to deal with users trashbins                          | `trashbin_retention_obligation`             | `auto`                           |
| `VERSIONS_RETENTION`               | How to deal with File Versions                            | `versions_retention_obligation`             | `auto`                           |

### Networking

The following ports are exposed.

| Port | Description |
| ---- | ----------- |
| `80` | HTTP        |

## Upgrading from the 2.x Series
- If you are upgrading from the 2.x series of images (Nextcloud 20 and below) please note that the following environment variables have been introduced

- `TEMP_DIRECTORY` - For holding temporary files
- `CACHE_DIRECTORY` - Moving the "Cache" per user out of their user data folder for those using S3 Backend for performance reasons
- `APP_DIRECTORY` - Applications downloaded from the App Store
- `DATA_DIRECTORY` - Users Data Directory

- You will also need to export new volumes if you are using the new defaults to these paths above:

| Environment Variable | 2.x Images volume mapping        | New Image mapping          |
| -------------------- | -------------------------------- | -------------------------- |
| `APP_DIRECTORY`      | `/www/nextcloud/custom-apps`     | `/data/apps`               |
| `CACHE_DIRECTORY`    | unset                            | `/data/cache`              |
| `DATA_DIRECTORY`     | `/www/nextcloud/data`            | `/data/userdata`           |
| `SKELETON_DIRECTORY` | `${NGINX_WEBROOT}/core/skeleton` | `/data/templates/skeleton` |
| `TEMP_DIRECTORY`     | unset                            | `/data/tmp`                |

- Additionally you will need to make a change to the database to support the change of the data location as listed [here](https://docs.nextcloud.com/server/21/admin_manual/issues/general_troubleshooting.html#troubleshooting-data-directory).

* * *
## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

``bash
docker exec -it (whatever your container name is) bash
``
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) personalized support.
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.


## References

* https://nextcloud.com

