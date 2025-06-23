#!/bin/bash

# Определяем переменные
SOURCE_DIR=~
DEST_DIR=/tmp/backup
LOG_FILE=/var/log/backup.log
TIMESTAMP=$(date +"%d-%m-%Y_%H:%M:%S")

# Выполняем копирование
rsync -aAXvz --delete "$SOURCE_DIR" "$DEST_DIR" >> "$LOG_FILE" 2>&1

# Проверяем результат
if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Резервное копирование успешно завершено" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] Ошибка при резервном копировании" | tee -a "$LOG_FILE"
fi
