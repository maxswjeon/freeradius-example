#!/bin/bash

# Source LDAP Variables from Envrionment Variables

# Remove Trailing Comma
LDAP_BIND_DN="cn=admin,$LDAP_BASE_DN"

sed -i "s|{{ LDAP_SERVER }}|'${LDAP_SERVER}'|g"         /etc/freeradius/mods-enabled/ldap
sed -i "s|{{ LDAP_PORT }}|${LDAP_PORT}|g"		/etc/freeradius/mods-enabled/ldap
sed -i "s|{{ LDAP_BIND_DN }}|'${LDAP_BIND_DN}'|g"       /etc/freeradius/mods-enabled/ldap
sed -i "s|{{ LDAP_BIND_PW }}|'${LDAP_BIND_PW}'|g"       /etc/freeradius/mods-enabled/ldap
sed -i "s|{{ LDAP_BASE_DN }}|'${LDAP_BASE_DN}'|g"       /etc/freeradius/mods-enabled/ldap

sed -i "s|{{ RADIUS_PASSWORD }}|${RADIUS_PASSWORD}|g"	/etc/freeradius/clients.conf

sed -i "s|certificate_file = \${certdir}/server.pem|certificate_file = /certs/fullchain.pem|g"        /etc/freeradius/mods-available/eap
sed -i "s|private_key_file = \${certdir}/server.pem|private_key_file = /certs/privkey.pem|g"          /etc/freeradius/mods-available/eap
sed -i "s|\${cadir}/ca.pem|/certs/chain.pem|g"                                                           /etc/freeradius/mods-available/eap

chmod 644 /certs/chain.pem
chmod 644 /certs/fullchain.pem
chmod 644 /certs/privkey.pem

sed -i "s|{{ DATABASE_PASSWORD }}|$DATABASE_PASSWORD|g" /etc/freeradius/mods-available/sql
