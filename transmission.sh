#!/bin/bash

exec /sbin/setuser nobody transmission-daemon -g /config  -e /config/transmission.log
