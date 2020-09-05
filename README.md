# Docker образ утилиты gobackup

https://github.com/huacnlee/gobackup

### Пример конфига `docker-compose.yml`
Каждые 10 минут
```
gobackup:
  build:
    context: ./backup
    dockerfile: Dockerfile
  volumes: 
    - ./gobackup.yml:/etc/gobackup/gobackup.template.yml 
    - ./.data/backups:/backups
  environment:
    FTP_HOST: localhost
    SCHEDULE: "0 */10 * * * *"
```

### Конфиг `gobackup.yml` 
Подробно: https://gobackup.github.io/

При запуске переменные ${VAR} заменяются на перменные окружения

```
models:
  vodopad:
    compress_with:
      type: tgz
    store_with:
      type: ftp
      host: ${FTP_HOST}
      port: ${FTP_PORT}
      path: ${FTP_PATH}
      username: ${FTP_USERNAME}
      password: ${FTP_PASSWORD}
    databases:
      main:
        database: ${POSTGRES_DB}
        type: postgresql
        host: postgresql
        port: 5432
        username: ${POSTGRES_USER}
        password: ${POSTGRES_PASSWORD}
  ```

### Просмотр заданий
Выполнить внутри контейнера - `curl -v localhost:18080`

### Восстановление базы данных
`./restore.sh db.tar.gz test_db`