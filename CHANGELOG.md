## 28-3.6.29 2024-02-05 <dave at tiredofit dot ca>

   ### Added
      - Notify Push 0.6.9


## 28-3.6.28 2024-02-01 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.2


## 28-3.6.27 2024-01-25 <dave at tiredofit dot ca>

   ### Added
      - Notify Push 0.6.8


## 28-3.6.26 2024-01-18 <dave at tiredofit dot ca>

   ### Added
      - Notify Push 0.6.7


## 28-3.6.25 2023-12-21 <joergmschulz@github>

   ### Added
      - Nextcloud 28.0.1


## 28-3.6.24 2023-12-15 <dave at tiredofit dot ca>

   ### Added
      - Client Push 0.6.6


## 28-3.6.23 2023-12-12 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0


## 28-3.6.22 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0rc4


## 28-3.6.21 2023-12-07 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0rc3


## 28-3.6.20 2023-11-30 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0rc2


## 28-3.6.19 2023-11-25 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0rc1


## 28-3.6.18 2023-11-16 <dave at tiredofit dot ca>

   ### Added
      - Adjust nginx configuration to support ogg and flac for Nextcloud Talk


## 28-3.6.17 2023-11-16 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0beta4


## 28-3.6.16 2023-11-14 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0beta3


## 28-3.6.15 2023-11-11 <dave at tiredofit dot ca>

   ### Added
      - notify_push 0.6.5


## 28-3.6.14 2023-11-10 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0beta2


## 28-3.6.13 2023-11-08 <dave at tiredofit dot ca>

   ### Added
      - Notify Push 0.6.4


## 28-3.6.12 2023-11-02 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 28.0.0beta1


## 27-3.6.11 2023-10-26 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.1.3


## 27-3.6.10 2023-10-05 <dave at tiredofit dot ca>

   ### Added
      - Rebuild of Nextcloud 27.1.2


## 27-3.6.9 2023-10-05 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.1.2


## 27-3.6.8 2023-09-29 <dave at tiredofit dot ca>

   ### Added
      - Add mjs support to Nginx


## 27-3.6.7 2023-09-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.1.1


## 27-3.6.6 2023-09-18 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.1.0


## 27-3.6.5 2023-08-14 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.2


## 27-3.6.4 2023-07-20 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.1


## 27-3.6.3 2023-06-13 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0


## 27-3.6.2 2023-06-09 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0rc4


## 27-3.6.1 2023-06-01 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0rc3


## 27-3.6.0 2023-05-31 <dave at tiredofit dot ca>

   ### Added
      - Restore previously removed notify_push files backend daemon and optimize to work behind reverse proxies


## 27-3.5.7 2023-05-25 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0rc2


## 27-3.5.6 2023-05-17 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0-rc1


## 27-3.5.5 2023-05-16 <dave at tiredofit dot ca>

   ### Added
      - Notify Push 0.6.3


## 27-3.5.4 2023-05-12 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0beta2


## 27-3.5.3 2023-05-05 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0beta1


## 27-3.5.2 2023-05-05 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 27.0.0beta1


## 26-3.5.1 2023-05-04 <dave at tiredofit dot ca>

   ### Added
      - Move back to PHP 8.2
      - Start building ane enabling dlib and pdlib extension for Face Recognition features


## 26-3.5.0 2023-04-26 <dave at tiredofit dot ca>

   ### Added
      - Introduce support for '_FILE' environment variables


## 26-3.4.48 2023-04-21 <dave at tiredofit dot ca>

   ### Changed
      - Downgrade to PHP 8.1 to solve Alpine Edge upstream issues


## 26-3.4.47 2023-04-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.1


## 26-3.4.46 2023-03-29 <dave at tiredofit dot ca>

   ### Added
      - Notify_push 0.62


## 26-3.4.45 2023-03-24 <dave at tiredofit dot ca>

   ### Added
      - Enable SYSVSEM module


## 26-3.4.44 2023-03-23 <dave at tiredofit dot ca>

   ### Changed
      - Rework some opcache configuration and let base image handle things


## 26-3.4.43 2023-03-23 <dave at tiredofit dot ca>

   ### Changed
      - Rework Nginx and PHP configuration for better performance
      - NGINX Timeouts set to 600
      - PHP Timeouts set to 600
      - Change FASTCGI Buffers to 64 4k
      - Change Body Buffer to 512k


## 26-3.4.42 2023-03-21 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0


## 26-3.4.41 2023-03-16 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0rc3


## 26-3.4.40 2023-03-09 <dave at tiredofit dot ca>

   ### Added
      - Reintroduce armv7 and aarch64 support for notify_push

   ### Changed
      - Strip out old legacy php configuration files and revert to using environment variables for OPCACHE


## 26-3.4.39 2023-03-09 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0rc2


## 26-3.4.38 2023-03-07 <dave at tiredofit dot ca>

   ### Added
      - Start building notify_push from source


## 26-3.4.37 2023-03-07 <dave at tiredofit dot ca>

   ### Added
      - notify_push 0.6.0


## 26-3.4.36 2023-03-02 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0rc1


## 26-3.4.35 2023-02-27 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0beta 5


## 26-3.4.34 2023-02-16 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0beta 4


## 26-3.4.33 2023-02-09 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0beta3


## 26-3.4.32 2023-02-02 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0 beta 2


## 26-3.4.31 2023-01-26 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 26.0.0beta1


## 25-3.4.30 2023-01-25 <dave at tiredofit dot ca>

   ### Added
      - Notify Push plugin 0.5.2


## 3.4.29 2023-01-17 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.3


## 3.4.28 2022-12-11 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.2


## 3.4.27 2022-12-01 <dave at tiredofit dot ca>

   ### Changed
      - Fix spelling mistake limiting ability to disable notify_push plugin


## 3.4.26 2022-12-01 <dave at tiredofit dot ca>

   ### Changed
      - Rework Dockerfile


## 3.4.25 2022-11-28 <dave at tiredofit dot ca>

   ### Changed
      - Additional workflow fixes


## 3.4.24 2022-11-28 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Notify Push


## 3.4.23 2022-11-28 <dave at tiredofit dot ca>

   ### Changed
      - Rework Dockerfile and Github Actions


## 3.4.22 2022-11-28 <dave at tiredofit dot ca>

   ### Changed
      - Fix for new installations failing


## 3.4.21 2022-11-23 <dave at tiredofit dot ca>

   ### Added
      - Bump tp Alpine 3.17 base


## 3.4.20 2022-11-22 <dave at tiredofit dot ca>

   ### Added
      - Add OVERWRITE_CLI_URL (credit radarsymphony@github)


## 3.4.19 2022-11-19 <dave at tiredofit dot ca>

   ### Added
      - Notify Push plugin 0.5.0


## 3.4.18 2022-11-03 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.1


## 3.4.17 2022-10-19 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0


## 3.4.16 2022-10-17 <dave at tiredofit dot ca>

   ### Changed
      - Fix spelling mistake during a version upgrade


## 3.4.15 2022-10-14 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0rc5


## 3.4.14 2022-10-13 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0rc4


## 3.4.13 2022-10-13 <dave at tiredofit dot ca>

   ### Added
      - Take advantage of new OPcache customizable features in tiredofit/nginx-php-fpm:7.2.0


## 3.4.12 2022-10-06 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0rc3


## 3.4.11 2022-10-05 <dave at tiredofit dot ca>

   ### Changed
      - Migrate legacy nginx configuration


## 3.4.10 2022-09-29 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0rc2


## 3.4.9 2022-09-23 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0rc1


## 3.4.8 2022-09-19 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0beta7


## 3.4.7 2022-09-11 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0beta6


## 3.4.6 2022-09-02 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0beta4


## 3.4.5 2022-08-25 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0beta3


## 3.4.4 2022-08-17 <dave at tiredofit dot ca>

   ### Added
      - Start using Exec statements

   ### Changed
      - Fix Dockerfile stating its still 24


## 3.4.3 2022-08-15 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 25.0.0.beta1


## 3.4.2 2022-08-12 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 24.0.4


## 3.4.1 2022-08-06 <dave at tiredofit dot ca>

   ### Added
      - Start using custom_scripts and custom_files functions from base


## 3.4.0 2022-08-05 <dave at tiredofit dot ca>

   ### Added
      - Refactor and seperate into functions

   ### Reverted
      - Remove included Fail2ban and rely on base image instead


## 3.3.10 2022-07-20 <dave at tiredofit dot ca>

   ### Changed
      - Quiet down some startup routines
      - Disable Gearman Extension


## 3.3.9 2022-07-20 <dave at tiredofit dot ca>

   ### Changed
      - Stop loading duplicate opcache entries
      - Remove PHP7 configuration
      - Switch to PHP 8.1 base


## 3.3.8 2022-07-18 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 24.0.3


## 3.3.7 2022-06-23 <dave at tiredofit dot ca>

   ### Added
      - Patchup to 24-3.3.6


## 3.3.6 2022-06-23 <dave at tiredofit dot ca>

   ### Added
      - Support tiredofit/nginx:6.0.0 and tiredofit/nginx-php-fpm:7.0.0 changes


## 3.3.5 2022-06-21 <dave at tiredofit dot ca>

   ### Added
      - Add PCNTL php extension


## 3.3.4 2022-06-20 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 24.0.2


## 3.3.3 2022-05-19 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 24.0.1


## 3.3.2 2022-05-11 <dave at tiredofit dot ca>

   ### Changed
      - Code cleanup and remove old functions


## 3.3.1 2022-05-06 <dave at tiredofit dot ca>

   ### Added
      - Notify Push plugin 0.4.0


## 3.3.0 2022-05-03 <dave at tiredofit dot ca>

   ### Added
      - Nextcloud 24.0.0


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
