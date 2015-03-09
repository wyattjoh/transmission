#!/bin/bash

exec /sbin/setuser nobody transmission-daemon -f -g /config -e /config/transmission.log
