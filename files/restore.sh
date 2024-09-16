#!/bin/bash\

BACKUP_DIR="/tmp/backup"
BACKUP_SERVER="192.168.6.12"
LOGIN="user"
FULL_BACKUP_PATH=$LOGIN@$BACKUP_SERVER:$BACKUP_DIR

BACKUP_LIST=$(ssh $LOGIN@$BACKUP_SERVER "ls $BACKUP_DIR" 2>/dev/null)

if [[ "$BACKUP_LIST" == "" ]]; then
  echo -e "Бекапы отсутствуют"
else
  echo "Выберите имя бэкапа для восстановления:"

  echo -e "$BACKUP_LIST\n"
  read SOURCE_BACKUP

  while ! [[ $BACKUP_LIST == *"$SOURCE_BACKUP"* ]]; do
    echo -e "Бэкапа с таким имененм нет. Проверьте правильность вводимого имени или нажмите CTRL+C для отмены."
    read SOURCE_BACKUP
  done

  echo -e "\nВведите путь для восстановления"
  read DESTINATION

  echo -e "\nВыполняется восстановление бэкапа $SOURCE_BACKUP в $DESTINATION"
  rsync -a -e ssh "$FULL_BACKUP_PATH/$SOURCE_BACKUP" $DESTINATION
  RESULT=$?
  if [[ $RESULT -ne 0 ]]; then
    rm -r $DESTINATION
    echo -e "\nПроцесс восстановления завершен с ошибкой (ERROR $RESULT). Все действия отменены."
  else
    echo -e "\nПроцесс восстановления завершен успешно."
  fi
fi