#!/bin/sh

CREDENTIAL_FILE="$(mktemp)"
echo "dns_cloudflare_api_token = $CLOUDFLARE_API_TOKEN" > "$CREDENTIAL_FILE"

if [ ! -d "/etc/letsencrypt/live/${DOMAIN}_ecc" ]; then
	certbot certonly --dns-cloudflare --dns-cloudflare-credentials "$CREDENTIAL_FILE" --agree-tos -m "$MAIL" -d "$DOMAIN" --key-type ecdsa --elliptic-curve secp384r1 --cert-name "${DOMAIN}_ecc"	
fi

if [ ! -d /certs/ldap ]; then
	mkdir /certs/ldap
fi

if [ ! -d /certs/freeradius ]; then
	mkdir /certs/freeradius
fi

touch /healthy

while true; do
	certbot renew
	
	cp -v "/etc/letsencrypt/live/${DOMAIN}_ecc/fullchain.pem" /certs/ldap
	cp -v "/etc/letsencrypt/live/${DOMAIN}_ecc/privkey.pem"   /certs/ldap
	cp -v "/etc/letsencrypt/live/${DOMAIN}_ecc/chain.pem"     /certs/ldap
	
	cp -v "/etc/letsencrypt/live/${DOMAIN}_ecc/fullchain.pem" /certs/freeradius
	cp -v "/etc/letsencrypt/live/${DOMAIN}_ecc/privkey.pem"   /certs/freeradius
	cp -v "/etc/letsencrypt/live/${DOMAIN}_ecc/chain.pem"     /certs/freeradius
	
	sleep 1d
done
