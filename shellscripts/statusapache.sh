#!/bin/bash
DATAHORA=$(date '+%d/%m/%Y %H:%M:%S')
STATUS=$(systemctl status httpd)

if [[ $STATUS == *"active (running)"* ]]; then
	echo "${DATAHORA} - HTTPD, ONLINE, O Apache está ativo" | tee -a /shellscripts/apache_on.txt
else
	echo "${DATAHORA} - HTTPD, OFFLINE, O Apache não está ativo" | tee -a /shellscripts/apache_off.txt
fi
