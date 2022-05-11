## 3.2.5 2022-05-11 <dave at tiredofit dot ca>

   ### Changed
      - Tidying up some variables and removing old functions unnecessary


## 3.2.4 2022-05-06 <dave at tiredofit dot ca>

   ### Added
      - Notify Push 0.4.0


## 3.2.3 2022-04-22 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 23.0.4


## 3.2.2 2022-04-20 <dave at tiredofit dot ca>

   ### Changed
      - Change defaults for Previews
      - Change defaults for Trusted Proxies for notify_push


## 3.2.1 2022-03-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 23.0.3


## 3.2.0 2022-02-24 <dave at tiredofit dot ca>

   ### Added
      - Add MONITORING_APPLICATION_TOKEN for dynamically updating credfentials if serverinfo application installed for monitoring purposes


## 3.1.5 2022-02-16 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 23.0.2


## 3.1.4 2022-02-11 <joergmschulz@github>

   ### Changed
      - Fix for updating admin password on container boot


## 3.1.3 2022-02-10 <dave at tiredofit dot ca>

   ### Changed
      - Update to support upstream base image changes


## 3.1.2 2022-01-31 <dave at tiredofit dot ca>

   ### Changed
      - Temporarily stop installing unrar


## 3.1.1 2022-01-31 <dave at tiredofit dot ca>

   ### Added
      - Nextclouid 23.0.1
      - PHP 8.0 backend


## 3.1.0 2021-12-01 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 23.0.0


## 3.0.14 2021-12-01 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 22.2.3


## 3.0.13 2021-12-01 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.7


## 3.0.12 2021-11-19 <dave at tiredofit dot ca>

   ### Added
      - notify_push plugin 0.3.0


## 3.0.11 2021-11-11 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.6


## 3.0.10 2021-10-28 <dave at tiredofit dot ca>

   ### Changed
      - Adjust Parsing for Nextcloud logs (Fluent-bit)
      - Rework the alias for the occ


## 3.0.9 2021-10-14 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.5


## 3.0.8 2021-09-28 <dave at tiredofit dot ca>

   ### Added
      - notify_push backend 0.2.4


## 3.0.7 2021-09-12 <dave at tiredofit dot ca>

   ### Added
      - notify_push bumped to 0.23


## 3.0.6 2021-08-16 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.4


## 3.0.5 2021-08-12 <dave at tiredofit dot ca>

   ### Added
      - client_push 0.2.2


## 3.0.4 2021-07-12 <dave at tiredofit dot ca>

   ### Added
      - notify_push plugin 0.2.1


## 3.0.3 2021-07-08 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.3


## 3.0.2 2021-05-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.2


## 3.0.1 2021-04-13 <dave at tiredofit dot ca>

   ### Added
      - notify_push plugin 0.17

   ### Changed
      - Change to nginx configuration for notify_push plugin/Files backend


## 3.0.0 2021-04-11 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 21.0.1
      - PHP 7.4 (Some plugins are not compatible with 8 yet)
      - Nextcloud Rust Files Backend component included
      - Additional environment variables for cache, tmp, data directory ** BREAKING CHANGES ** See README
      - Additional environment variables for File sharing enforcement and email notifications
      - Add fail2ban Support
      - Configurable Audit File Location
      - Auto Reset ADMIN Password on restart
      - Allow Application to be displayed in IFrames
      - Add Sharing Folder customization
      - General Refresh and Cleanup

## 2.3.6 2021-02-11 <dave at tiredofit dot ca>

   ### Added
      - Switch to PHP 7.4 as base


## 2.3.5 2021-02-08 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 20.0.7


## 2.3.4 2020-09-22 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 19.0.3


## 2.3.3 2020-08-19 <joergmschulz@github>

   ### Changed
      - Fix first run wizard not showing videos on startup

## 2.3.2 2020-08-19 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 19.0.1


## 2.3.1 2020-06-15 <dave at tiredofit dot ca>

   ### Added
      - Update to support tiredofit/alpine base image 5.x changes


## 2.3.0 2020-06-05 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 19.0.0
      - Added PHP exntesions to support passwordless login


## 2.2.4 2020-05-06 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 18.0.4


## 2.2.3 2020-04-15 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 18.0.3


## 2.2.2 2020-03-13 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 18.0.2


## 2.2.1 2020-02-13 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 18.0.1


## 2.2.0 2020-01-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 18.0.0


## 2.1.1 2020-01-02 <dave at tiredofit dot ca>

   ### Changed
      - Additional changes to support new tiredofit/alpine base image


## 2.1.0 2019-12-29 <dave at tiredofit dot ca>

   ### Added
      - Changes to support new tiredofit/alpine and tiredofit/nginx images


## 2.0.2 2019-12-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 17.0.2


## 2.0.1 2019-12-18 <dave at tiredofit dot ca>

   ### Changed
      - Bugfixes to Automatic Update
      - Bugfix to properly detect if Cron is in use


## 2.0.0 2019-12-17 <dave at tiredofit dot ca>

   ### Added
      - Refactored image to utilize tiredofit/nginx-php-fpm base image
      - Refactored image to support dynamic configuration building
      - Many more modifications and code cleanup


## 1.5.4 2019-11-12 <dave at tiredofit dot ca>

* Nextcloud 17.0.1

## 1.5.3 2019-11-04 <dave at tiredofit dot ca>

* Bugfix

## 1.5.2 2019-11-04 <dave at tiredofit dot ca>

* More Nginx Configuration
* PHP Memory Tuning for High load

## 1.5.1 2019-10-28 <dave at tiredofit dot ca>

* Update Nginx Configuration
* Add Imagemagick

## 1.5.0 2019-10-28 <dave at tiredofit dot ca>

* Nextcloud 17.0.0

## 1.4.5 2019-10-28 <dave at tiredofit dot ca>

* PHP 7.3.11
* Nextcloud 16.0.5

## 1.4.4 2019-09-25 <dave at tiredofit dot ca>

* PHP 7.3.9

## 1.4.3 2019-08-29 <dave at tiredofit dot ca>

* Nextcloud 16.0.4
* PHP 7.3.8

## 1.4.2 2019-07-15 <dave at tiredofit dot ca>

* Nextcloud 16.0.3
* PHP 7.3.7

## 1.4.1 2019-05-20 <dave at tiredofit dot ca>

* Nextcloud 16.0.1

## 1.4.0 2019-05-16 <dave at tiredofit dot ca>

* Nextcloud 16.0
* PHP 7.3.5

## 1.3.4 2019-04-09 <dave at tiredofit dot ca>

* Nextcloud 15.0.7

## 1.3.3 2019-03-26 <dave at tiredofit dot ca>

* Switch to PHP 7.3.3 - Refactor Dockerfile

## 1.3.2 2019-03-04 <dave at tiredofit dot ca>

* Nextcloud 15.0.5

## 1.3.1 2019-02-09 <dave at tiredofit dot ca>

* Alpine 3.9
* Nextcloud 15.0.4
* PHP 7.2.15

## 1.3 2018-12-10 <dave at tiredofit dot ca>

* PHP 7.2.13
* Nextcloud 15.0.0

## 1.2.5 2018-11-22 <dave at tiredofit dot ca>

* PHP 7.2.12
* Nextcloud 14.0.4

## 1.2.4 2018-10-21 <dave at tiredofit dot ca>

* PHP 7.2.11

## 1.2.3 2018-10-21 <dave at tiredofit dot ca>

* Bump to 14.0.3

## 1.2.2 2018-10-12 <dave at tiredofit dot ca>

* Bump Nextcloud 14.0.2
* PHP 7.2.12

## 1.2.1 2018-09-16 <dave at tiredofit dot ca>

* Add custom templates for when using Collabora Online / Libreoffice Online to Default to English

## 1.2 2018-09-11 <dave at tiredofit dot ca>

* Bump to Nextcloud 14.0.0
* PHP 7.2.9
* Cleanup Scripts

## 1.12 2018-09-03 <dave at tiredofit dot ca>

* Bump to Nextcloud 13.0.6
* PHP 7.2.8

## 1.11 2018-06-08 <dave at tiredofit dot ca>

* Bump to 13.0.3
* PHP 7.27

## 1.10 2018-04-29 <dave at tiredofit dot ca>

* Bump to 13.0.2

## 1.9 2018-04-29 <dave at tiredofit dot ca>

* PHP 7.2.4
* Added ADMIN_GROUP environment variable. Comma seperate usernames to be added to Admin group (Useful for LDAP/SAML)

## 1.81 2018-03-07 <dave at tiredofit dot ca>

* PHP 7.2.3
* PECL Mcrypt

## 1.8 2018-03-07 <dave at tiredofit dot ca>

* Compile PHP to fix LDAP / Iconv Regression

## 1.71 2018-02-18 <dave at tiredofit dot ca>

* Minor Bugfix

## 1.7 2018-02-06 <dave at tiredofit dot ca>

* Bump to 13.0.0

## 1.6 2018-02-01 <dave at tiredofit dot ca>

* Rebase

## 1.5 2018-01-18 <dave at tiredofit dot ca>

* Fix App Upgrading issue on Startup

## 1.42 2017-10-24 <dave at tiredofit dot ca>

* Version Bump 12.04

## 1.41 2017-10-24 <dave at tiredofit dot ca>

* Fix config.php script generation

## 1.4 2017-10-24 <dave at tiredofit dot ca>

* Version Bump 12.0.3

## 1.3 2017-08-28 <dave at tiredofit dot ca>

* File Structure Reorganization and Layer Compaction
* Add filesystem logging default

## 1.2 2017-08-19 <dave at tiredofit dot ca>

* Added Logrotate
* Add entries for custom logging

## 1.1 2017-07-23 <dave at tiredofit dot ca>

* Fixed some funkiness with Custom Apps

## 1.0 2017-07-22 <dave at tiredofit dot ca>

* Initial Release
* PHP 7.1 Base
* Nextcloud 12
