#!/bin/ash
set -e

if [ -n "$MOSQUITTO_USERNAME" ] && [ -n "$MOSQUITTO_PASSWORD" ]; then
  passwordfile_path=$PWD/passwd
  touch $passwordfile_path
  mosquitto_passwd -b $passwordfile_path $MOSQUITTO_USERNAME $MOSQUITTO_PASSWORD
fi

if [ -n "$MOSQUITTO_CONFIG_URL" ]; then
  config_path=$PWD/config/mosquitto.conf
  if [ -n "$MOSQUITTO_CONFIG_USERNAME" ] && [ -n "$MOSQUITTO_CONFIG_PASSWORD" ]; then
    wget -q -O $config_path --http-user=$MOSQUITTO_CONFIG_USERNAME --http-password=$MOSQUITTO_CONFIG_PASSWORD $MOSQUITTO_CONFIG_URL
  else
    wget -q -O $config_path $MOSQUITTO_CONFIG_URL
  fi
fi

exec "$@"