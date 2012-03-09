#!/bin/bash

mkdir -p "$basedir/../etc/$version/conf.d"

etcbasedir="`readlink -f "$basedir/../etc/$version"`"

configoptions="\
--with-config-file-path=$etcbasedir
--with-config-file-scan-dir=$etcbasedir/conf.d
--enable-debug \
--disable-short-tags \
--without-pear \
--enable-pdo \
--with-pdo-pgsql=/usr \
--with-readline
--enable-pcntl
--enable-bcmath=shared
--enable-calendar=shared
--enable-dba=shared
--enable-exif=shared
--enable-ftp=shared
--enable-gd-native-ttf
--enable-intl=shared
--enable-json=shared
--enable-mbregex
--enable-mbstring
--enable-phar=shared
--enable-posix=shared
--enable-session
--enable-shmop=shared
--enable-sockets=shared
--enable-sysvmsg=shared
--enable-sysvsem=shared
--enable-sysvshm=shared
--enable-xml
--enable-zip=shared
--with-bz2=shared
--with-curl=shared
--with-freetype-dir=shared,/usr
--with-gd=shared
--with-iconv=shared
--with-icu-dir=/usr
--with-jpeg-dir=shared,/usr
--with-mhash
--with-mysql-sock=/var/run/mysqld/mysqld.sock
--with-openssl=shared
--with-pcre-regex=/usr
--with-pdo-mysql=shared,mysqlnd
--with-pdo-pgsql=shared
--with-pdo-sqlite=shared,/usr
--with-png-dir=shared,/usr
--with-pspell=shared
--with-regex=php
--with-xsl=shared
--with-zlib
--without-db2
--without-db3"
