docker-moodle [![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)
=============

Docker image of Moodle with [MOOSH](http://moosh-online.com) and [s6-overlay](https://github.com/just-containers/s6-overlay) for use with an external Database.

## Environment variables

- **PHPMAXUPLOAD** : Increase PHP file upload limit *(default: "100M")*
- **TLS** : For secure connection *(default: "no")*
- **APPADMIN** : Moodle application username *(default: "admin")*
- **APPADMINPASS** : Moodle application password *(default: "generate random password")*
- **APPADMINEMAIL** : Moodle application email. *(default: "admin@lochalhost.local")*
- **APPDIR** : Moodle application directory *(default: "/var/www/html")*
- **SUBDIR** : Moodle application in a subdirectory *(No defaults)*
- **TZ** : Set timezone *(default: "Etc/UTC")*
###### Silent Install ######
- **SILENTINSTALL** : yes/no *(default: "no")*
- **APPDB** : Database name that Moodle will use to connect with the database *(default: "moodle")*
- **APPDBUSER** : Database user that Moodle will use to connect with the database *(default: "moodle")*
- **APPDBPASS** : Database password that Moodle will use to connect with the database *(default: "generate random password")*
- **CREATEDB** : yes/no *(default: "yes")*
- **DBTYPE** : Moodle application database type to connect with the database *(default: "mariadb")*
- **FULLNAME** : Moodle application full name *(default: "Moodle")*
- **SHORTNAME** : Moodle application short name *(deafult: "MOODLE")*
- **SUMMARY** : Moodle application summary *(default: "Moodle")*
- **SSLPROXY** : Set "yes" to use moodle application behind proxy server *(default: "no")*
- **REVERSEPROXY** : Set "yes" to use moodle application with port forwarding *(default: "no")* 
- **SERVERNAME** : Set servername *(default: "127.0.0.1")*
- **MYSQL_ROOT** : Database admin user *(default: "root")*
- **MYSQL_ROOT_PASSWORD** : Database password for MYSQL_ROOT *(default: "cat /run/secrets/mysql-root")*
- **MYSQL_HOST** : Hostname for MariaDB server *(default: "mariadb")*
- **MYSQL_PORT** : Port used by MariaDB server *(default: "3306")*
###### Swarm ######
- **HOSTTOINSTALL** : For use in clusters with shared Moodle folder. For example is `hostname: "moodle-{{.Task.Slot}}"` then set `HOSTTOINSTALL=moodle-1` to let install only the first slot *(No defaults)*

## Passing additional install scripts
To be able to use this image more dynamically, the installation script checks if the /extra-scripts folder exists and executes found scripts in there.
