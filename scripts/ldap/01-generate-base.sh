#!/bin/sh

cat <<EOF > /tmp/01-base-data.ldif
dn: ou=people,${BASE_DN}
changeType: add
ou: people
objectClass: top
objectClass: organizationalUnit

dn: ou=groups,${BASE_DN}
changeType: add
objectClass: top
objectClass: organizationalUnit
ou: groups
EOF

ldapmodify -H 'ldapi:///' -D "cn=admin,${BASE_DN}" -w $ADMIN_PASS -f /tmp/01-base-data.ldif
rm -rf /tmp/01-base-data.ldif
