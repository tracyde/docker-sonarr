#!/bin/bash

echo "updating sonarr"
rm -Rfv /opt/NzbDrone/*
mv $2/NzbDrone/* /opt/NzbDrone/

echo "sending term to sonarr, configure docker to automatically restart this container"
kill $1
