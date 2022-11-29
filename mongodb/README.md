# docker mongodb

## clone repo
```
git clone https://github.com/W3Tools/docker-compose.git && cd docker-compose/mongodb/
```

## Edit .env file to change privacy information
```
vim .env
```

## startup mongodb
```
docker compose up -d
```

## 1. login container
```
docker compose exec mongodb bash
```

## 1.1 login mongodb via mongo shell
```
mongo admin
```

## 2. login mongodb
```
docker compose exec mongodb mongo admin
```

## auth
```
db.auth('<mongo user>','<mongo password>')
```