# hub.docker.com/r/tiredofit/nextcloud

[![Build Status](https://img.shields.io/docker/build/tiredofit/nextcloud.svg)](https://hub.docker.com/r/tiredofit/nextcloud)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/nextcloud.svg)](https://hub.docker.com/r/tiredofit/nextcloud)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/nextcloud.svg)](https://hub.docker.com/r/tiredofit/nextcloud)
[![Docker 
Layers](https://images.microbadger.com/badges/image/tiredofit/nextcloud.svg)](https://microbadger.com/images/tiredofit/nextcloud)

# Introduction

Dockerfile to build a [Nextcloud](https://nextcloud.com) container image.

* This Container uses a [customized Alpine Linux base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) based on TRUNK compiled for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, mariadb-client, nano, vim) for easier management. It also supports sending to external SMTP servers..
*    Logrotate Included to roll over log files at 23:59, compress and retain for 7 days


[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy][https://github.com/tiredofit]

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
    - [Networking](#networking)
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

This image assumes that you are using a reverse proxy such as [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) and optionally the [Let's Encrypt Proxy Companion @ https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) in order to serve your pages. However, it will run just fine on it's own if you map appropriate ports.

This image also relies on an optional MariaDB/MySQL Server, and optionally, a Redis server


# Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/tiredofit/nextcloud) and is the recommended method of installation.


```bash
docker pull tiredofit/nextcloud
```

The following image tags are available:

* `latest` - Nextcloud 17
* `17`,`17-latest` - Nextcloud 15
* `16`,`16-latest` - Nextcloud 15
* `15`,`15-latest` - Nextcloud 15
* `14`,`14-latest` - Nextcloud 14
* `13`,`13-latest` - Nextcloud 13
* `12`,`12-latest` - Nextcloud 12

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See 
the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be 
modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this 
image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

# Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|
| `/www/nextcloud/data` | Nextcloud Data  |
| `/www/nextcloud/config` | Nextcloud Configuration Directory |
| `/www/nextcloud/custom-apps` | Custom Apps downloaded from Plugin Store |
| `/www/nextcloud/themes` | Custom Themes Directory |
| `/www/logs` | Nginx / php-fpm / Nextcloud logfiles |

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), the [Nginx]https://hub.docker.com/r/tiredofit/nginx), and the [https://hub.docker.com/r/tiredofit/nginx-php-fpm)PHP-FPM Engine](https://hub.docker.com/r/tiredofit/nginx-php-fpm) below is the complete list of available options that can be used to customize your installation.

If you there are features that you wish to override based on the defaults and for some reason the environment variables are not working, create a file called `custom.config.php` in your `data/config` directory

| Parameter | Description |
|-----------|-------------|
| `ADMIN_USER` | Admin user e.g. `admin`|
| `ADMIN_PASS` | Admin pass e.g. `password` | 
| `DOMAIN` | The Domain that this is configured for e.g. 'example.org' |
| `DB_TYPE` | Set the DB_TYPE - e.g. `mysql`, `postgres`, `sqlite3` - Default `sqlite3` |
| `DB_HOST` | Hostname of DB Server e.g. `nextcloud-db` |
| `DB_NAME` | Database name e.g. `nextcloud` |
| `DB_PORT` | Database port e.g. `3306` |
| `DB_USER` | Username for Database e.g. `nextcloud` |
| `DB_PASS` | Password for Database e.g. `password` |

This image automatically configures nextcloud with the following options as defined in [config.sample.php](https://github.com/nextcloud/server/blob/master/config/config.sample.php).

| Variable | Description | Nextcloud Attribute | Default |
|----------|-------------|---------------------|---------|
| `ENABLE_DISPLAY_NAME_CHANGE` |Allow user to change name | `allow_user_to_change_display_name` | `TRUE` |
| `ENABLE_APP_CODE_CHECKER` |  Check for signatures on all code    | `appcodechecker` | `TRUE` |
| `ENABLE_APP_STORE` | Enable App Store | `appstoreenabled` | `TRUE` |
| `ENABLE_BRUTEFORCE_PROTECTION` | Enable Brute Force Protection | `auth.bruteforce.protection.enabled` | `TRUE` |
| `CIPHER` | Encryption Cipher | `cipher` | `AES-256-CFB` |
| `DEFAULT_LANGUAGE` | Default Language to Install | `default_language` | `en` |
| `DEFAULT_LOCALE` | Default Locale | `default_locale` | `en_US` |
| `DEFAULT_APPLICATION` | Default Application users see | `defaultapp` | `files` |
| `ENABLE_PREVIEWS` | Enable Document Previews | `enable_previews` | `TRUE` |
| `FILE_LOCKING_DEBUG` | Debug File Locking | `filelocking.debug` | `FALSE` |
| `ENABLE_FILE_LOCKING` | Enable File Locking | `filelocking.enabled` | `TRUE` |
| `ENABLE_FILESYSTEM_CHECK_CHANGES` | Check changes on Filesystem in Background | `filesystem_check_changes` | `FALSE` |
| `FORCE_LANGUAGE` | Force Language | `force_language` | `en` |
| `FORCE_LOCALE` | Force Locale | `force_locale` | `en_US` |
| `HASHING_COST` | Performance Cost for Hashing | `hashingCost` | `10` |
| `ENABLE_KNOWLEDGE_BASE` | Enable Help Menu | `knowledgebaseenabled` | `TRUE` |
| `LDAP_CLEANUP_INTERVAL` | How many minutes to cleanup LDAP users  | `ldapUserCleanupInterval` | `51` |
| `ENABLE_LOG_QUERY` | Enable Logging DB Queries | `log_query` | `FALSE` |
| `LOG_DATE_FORMAT` | Format for Date and Time in logs | `logdateformat` | `Y-m-d H:i:s` |
| `LOG_DIR` | Log Directory | `logfile` | `/www/logs/nextcloud` |
| `ENABLE_LOGIN_FORM_AUTOCOMPLETE` | Allow Autocomplete on Login Pages | `login_form_autocomplete` | `TRUE` |
| `LOG_LEVEL` | Log Level | `loglevel` | `2` |
| `LOG_TIMEZONE` | Timezone for Logfile | `logtimezone` | Container Timezone |
| `SMTP_DOMAIN` | Email Domain for Outbound mail | `mail_domain` | `example.org` |
| `SMTP_FROM` | Account name for Outbound Email | `mail_from_address` | `noreply` |
| `SMTP_SEND_PLAINTEXT_ONLY` | Send Plaintext Email Only | `mail_send_plaintext_only` | `FALSE` |
| `ENABLE_SMTP_AUTHENTICATION` | Enable SMTP Authentication | `mail_smtpauth` | `FALSE` |
| `SMTP_AUTHENTICATION_TYPE` | Type of SMTP Authentication | `mail_smtpauthtype` | `NONE` |
| `SMTP_DEBUG` | Debug SMTP activities | `mail_smtpdebug` | `FALSE` |
| `SMTP_HOST` | Remote SMTP Host | `mail_smtphost` | `postfix_relay` |
| `SMTP_USER` | SMTP Username   | `mail_smtpname` | `` |
| `SMTP_PASS` | SMTP Password   | `mail_smtppassword` | `` |
| `SMTP_PORT` | SMTP Port   | `mail_smtpport` | `25` |
| `SMTP_SECURE` | Set if SMTP is TLS/SSL encrypted | `mail_smtpsecure` | `FALSE` |
| `SMTP_TIMEOUT` | Timeout for SMTP connections | `mail_smtptimeout` | `10` |
| `ANIMATED_GIFS_MAX_FILESIZE` | Max file size for Animated Gifs | `max_filesize_animated_gifs_public_sharing` | `10` |
| `ENABLE_MYSQL_UTF8MB4` | Enable 4 byte strings for MariaDB | `mysql.utf8mb4` | `TRUE` |
| `OVERWRITE_HOST` | Override the hostname for URLs | `overwritehost` | `` |
| `OVERWRITE_PROTOCOL` | Override the Protocol if behind proxy | `overwriteprotocol` | `` |
| `PREVIEW_MAX_X` | Maximum Pixels for Previews (X) | `preview_max_x` | `200` |
| `PREVIEW_MAX_Y` | Maximum Pixels for Previews (Y) | `preview_max_y` | `200` |
| `ENABLE_SESSION_KEEPALIVE` | Enable Keepalive sessions | `session_keepalive` | `TRUE` |
| `SHARING_MAX_AUTOCOMPLETE_RESULTS` | Maximum results returned when searching | `sharing.maxAutocompleteResults` | `0` |
| `SHARING_MIN_SEARCHSTRING_LENGTH` | How many characters to type before searching  | `sharing.minSearchStringLength` | `2` |
| `ENABLE_SIGN_UP` | Allow Signups to Instance | `simpleSignUpLink.shown` | `TRUE` |
| `SKELETON_DIRECTORY` | What folder is copied to new users folders on first login | `skeletondirectory` | `${NGINX_WEBROOT}/core/skeleton` |
| `SORT_GROUPS_BY_NAME` | Sort groups by name as opposed to most users | `sort_groups_by_name` | `FALSE` |
| `ENABLE_TOKEN_AUTH_ENFORCED` | Enforce logging in with Tokens for Clients | `token_auth_enforced` | `FALSE` |
| `TRASHBIN_RETENTION` | How to deal with users trashbins | `trashbin_retention_obligation` | `auto` |
| `VERSIONS_RETENTION` | How to deal with File Versions | `versions_retention_obligation` | `auto` |

### Networking

The following ports are exposed.

| Port      | Description |
|-----------|-------------|
| `80` | HTTP |

# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. nextcloud) bash
```

# References

* https://nextcloud.com



