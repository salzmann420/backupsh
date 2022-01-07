#!/bin/bash
# In the next line the backup storage from storageserver1 will be mounted
sudo mount -t cifs -o user=felix,password=181922,rw,file_mode=0777,dir_mode=0777 //192.168.178.48/GeneralFileDump/RaspiBackup /mnt/backup

#Variablen
BACKUP_PFAD="/mnt/backup"
BACKUP_ANZAHL="5"
BACKUP_NAME="RaspberryPi48GBSicherung"
#Backup erstellen
dd if=/dev/mmcblk0 of=${BACKUP_PFAD}/${BACKUP_NAME}-$(date +%Y%m%d).img bs=1MB
#Alte Sicherung löschen
pushd ${BACKUP_PFAD}; ls -tr ${BACKUP_PFAD}/${BACKUP_NAME}* | head -n -${BACKUP_ANZAHL} | xargs rm; popd
#Festplatte auswerfen
umount /mnt/backup
