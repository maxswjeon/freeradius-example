#!/bin/bash

cd /etc/freeradius/mods-enabled
ln -s ../mods-available/ldap ldap
ln -s ../mods-available/counter counter
ln -s ../mods-available/sql sql
cd -
