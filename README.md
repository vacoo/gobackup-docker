### Docker образ утилиты gobackup

https://github.com/huacnlee/gobackup

# Пример конфига
gobackup:
  build:
    context: ./backup
    dockerfile: Dockerfile
  volumes: 
    - ./gobackup.yml:/etc/gobackup/gobackup.yml 
    - ./.data/backups:/backups
  environment:
    SCHEDULE: "0 3 \* \* \*"

# Быстрый старт

