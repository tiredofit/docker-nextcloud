# hub.docker.com/tiredofit/nextcloud

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


* `12`,`12-latest` - Nextcloud 12
* `latest` - Nextcloud 12

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

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), and the [Nginx+PHP-FPM Engine](https://hub.docker.com/r/tiredofit/nginx-php-fpm) below is the complete list of available options that can be used to customize your installation.

| Parameter | Description |
|-----------|-------------|
| `ADMIN_USER` | Admin user e.g. `admin`|
| `ADMIN_PASS` | Admin pass e.g. `password` | 
| `DOMAIN` | The Domain that this is configured for e.g. 'example.org' |
| `DB_TYPE` | Set the DB_TYPE - e.g. `mysql` - Default `sqlite3` |
| `DB_HOST` | Hostname of DB Server e.g. `nextcloud-db` |
| `DB_NAME` | Database name e.g. `nextcloud` |
| `DB_USER` | Username for Database e.g. `nextcloud` |
| `DB_PASS` | Password for Database e.g. `password` |

### Networking

The following ports are exposed.

| Port      | Description |
|-----------|-------------|
| `80` | HTTP |

# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. ssp) bash
```

# References

* https://nextcloud.com



