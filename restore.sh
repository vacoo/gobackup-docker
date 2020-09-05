#! /bin/sh
export PGPASSWORD=$POSTGRES_PASSWORD

cd /backups

rm "$1"

# Скачиваем архив
lftp -u "$FTP_USERNAME","$FTP_PASSWORD" "$FTP_HOST" <<EOF

cd "$FTP_PATH" 
pget "$1"

bye
EOF

# Распаковка и восстановление в базу даннных
gunzip --stdout /backups/"$1" | psql -p "$POSTGRES_PORT" -U "$POSTGRES_USER" -h "$POSTGRES_HOST" -d "$2"