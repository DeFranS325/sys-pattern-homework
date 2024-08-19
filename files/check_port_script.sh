#!/bin/bash

FILE="/var/www/html/index.nginx-debian.html"
PORT="80"

if ss -tulpn | grep ":$PORT " > /dev/null; then
  if [ -e "$FILE" ]; then
    exit 0  #Порт открыт и файл существует
  else
    exit 1  #Порт открыт, но файла не существует
  fi
else
  if [ -e "$FILE" ]; then
    exit 1  #Порт закрыт, но файл существует
  else
    exit 1  #Порт закрыт и файл не существует
  fi
fi