#!/bin/sh

for f in $(find /docker-entrypoint.d -name \*.sh | sort); do
	echo "Running $f"
	. "$f"
done

freeradius -f -X
