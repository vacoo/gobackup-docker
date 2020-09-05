### Docker образ утилиты gobackup

https://github.com/huacnlee/gobackup

# Пример конфига `docker-compose.yml`
```
gobackup:
  build:
    context: ./backup
    dockerfile: Dockerfile
  volumes: 
    - ./gobackup.yml:/etc/gobackup/gobackup.yml 
    - ./.data/backups:/backups
  environment:
    SCHEDULE: "0 3 \* \* \*"
```

# Конфиг `gobackup.yml` 
Подробно: https://gobackup.github.io/
```
models:
  vodopad:
    compress_with:
      type: tgz
    store_with:
      type: ftp
      host: localhost
      port: 21
      path: ./backups
      username: project
      password: pass
    databases:
      main:
        database: db
        type: postgresql
        host: localhost
        port: 5432
        username: project
        password: 123
  ```
