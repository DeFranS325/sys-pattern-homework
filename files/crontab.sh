#!/bin/bash
rsync -a --delete-after . /tmp/backup >>/var/log/syslog 2>>/var/log/syslog