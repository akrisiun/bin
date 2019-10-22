#!/bin/bash

if [[ $(/etc/init.d/webmin status) = *running* ]]; then
    echo "webmin running"
    /etc/init.d/webmin status
else
    echo "webmin restarting"
    /etc/init.d/webmin restart
    echo "webmin status:"
    /etc/init.d/webmin status
fi
