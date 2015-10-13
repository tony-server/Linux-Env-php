#!/bin/bash

# If cleanup is set to "1", backups older than $OLDERTHAN days will be deleted!
CLEANUP=1
OLDERTHAN=7

DESTDIR="/alidata1/source_code_back"
SRCDIR="/alidata1/wwwroot"

# Get data in dd-mm-yyyy format
NOW="$(date +"%Y-%m-%d")"

### Libraries ###
CHOWN="$(which chown)"
if [ -z "$CHOWN" ]; then
    echo "Error: CHOWN not found"
    exit 1
fi
CHMOD="$(which chmod)"
if [ -z "$CHMOD" ]; then
    echo "Error: CHMOD not found"
    exit 1
fi
GZIP="$(which gzip)"
if [ -z "$GZIP" ]; then
    echo "Error: GZIP not found"
    exit 1
fi
CP="$(which cp)"
if [ -z "$CP" ]; then
    echo "Error: CP not found"
    exit 1
fi

if [ ! -d $DESTDIR ]; then
    mkdir -p $DESTDIR
fi

if [ $CLEANUP == 1 ]; then
    find $DESTDIR/ -name "*.zip" -type f -mtime +$OLDERTHAN -delete
fi

DESTFILE="$DESTDIR/wwwroot.$NOW.zip"
zip -r $DESTFILE $SRCDIR

