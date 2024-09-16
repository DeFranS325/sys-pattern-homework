#!bin/bash

BACKUP_DIR="/tmp/backup"
BACKUP_SERVER="192.168.6.12"
LOGIN="user"
FULL_BACKUP_PATH=$LOGIN@$BACKUP_SERVER:$BACKUP_DIR

BACKUP_NAME=$FULL_BACKUP_PATH/backup_$DATE

FOUND=$(ssh $LOGIN@$BACKUP_SERVER "find $BACKUP_DIR -maxdepth 1 -type d -name backup | wc -l") #Узнаем, есть ли папка для бэкапа
COUNT=$(ssh $LOGIN@$BACKUP_SERVER "ls $BACKUP_DIR | wc -l") #Узнаем, были ли бэкапы до этого

if ! [[ "$FOUND" -eq 0 ]]; then 
  #Нашли папку с бэкапами
  if [[ "$COUNT" -eq 0 ]]; then
    ssh $LOGIN@$BACKUP_SERVER "mkdir $BACKUP_DIR"
    rsync -a . $FULL_BACKUP_PATH/full_backup #Делаем первым полный бэкап
  else
    DATE=$(ssh $LOGIN@$BACKUP_SERVER "date -r $BACKUP_DIR/full_backup +%d%m%Y%H%M")
    if [[ "$COUNT" -le 4 ]]; then
      rsync -avhb --progress --delete --backup-dir=$BACKUP_DIR/backup_$DATE . $FULL_BACKUP_PATH/full_backup #Инкрементный бэкап
    else
      echo -e "Надо удалить старый бэкап:\n\n"
      BACKUP_LIST=$(ssh $LOGIN@$BACKUP_SERVER "ls $BACKUP_DIR | grep -E '^b'")
      echo "$BACKUP_LIST"
      echo '---------'

#      REMOVE_BACKUP=$(ssh $LOGIN@$BACKUP_SERVER "ls $BACKUP_DIR | grep -E '^b' | tail -n1")
      REMOVE_BACKUP=$(echo "$BACKUP_LIST" | grep -E '^b' | head -1)
      echo "Мы удаляем бэкап $REMOVE_BACKUP"
      ssh $LOGIN@$BACKUP_SERVER "rm -r $BACKUP_DIR/$REMOVE_BACKUP"
      rsync -avhb --progress --delete --backup-dir=$BACKUP_DIR/backup_$DATE . $FULL_BACKUP_PATH/full_backup #Инкрементный бэкап
    fi
  fi
else
  #Не нашли папку с бэкапами
  ssh $LOGIN@$BACKUP_SERVER "mkdir $BACKUP_DIR"
  rsync -a . $FULL_BACKUP_PATH/full_backup #Делаем первым полный бэкап
fi