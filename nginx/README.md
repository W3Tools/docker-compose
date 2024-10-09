# docker nginx

## clone repo
```
git clone https://github.com/W3Tools/docker-compose.git && cd docker-compose/nginx/
```

## generate ssl
```
openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout conf/.conf/nginx.key -out conf/.conf/nginx.crt
```

## startup nginx
```
docker compose build
docker compose up -d
```

# startup nginx with host network
```
docker compose -f docker-compose-hostnet.yaml up -d
```

## add website
```
cp conf/conf.d/config.example conf/conf.d/<website name>.conf # copy config file and modify
docker compose exec nginx nginx -s reload # reload nginx
```

## create ssl certificate
```
docker compose exec nginx certbot certonly --webroot --webroot-path /etc/nginx/webroot/letsencrypt --domains <domain name>
```
