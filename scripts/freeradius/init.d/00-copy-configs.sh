#!/bin/sh

cp -v /config/sql		/etc/freeradius/mods-available/sql
cp -v /config/ldap		/etc/freeradius/mods-available/ldap

cp -v /config/default		/etc/freeradius/sites-available/default
cp -v /config/inner-tunnel	/etc/freeradius/sites-available/inner-tunnel

cp -v /config/clients.conf	/etc/freeradius/clients.conf

cp -v /config/queries.conf      /etc/freeradius/mods-config/sql/main/postgresql/queries.conf
