#!/bin/bash
DATAHORA=$(date '+%d/%m/%Y %H:%M:%S')
STATUS=$(systemctl status httpd)

if [[ $STATUS == *"active (running)"* ]]; then
	echo "${DATAHORA} - HTTPD, ONLINE, O Apache está ativo" | tee -a /nfs/antonio/apache_log_on.txt
else
	echo "${DATAHORA} - HTTPD, OFFLINE, O Apache não está ativo" | tee -a /nfs/antonio/apache_log_off.txt
fi
