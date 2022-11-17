# docker nginx

## clone repo
```
git clone https://github.com/W3Tools/docker-compose.git && cd docker-compose/nginx/
```

## startup nginx
```
docker compose up -d
```

## add website
```
cp conf/conf.d/config.example conf/conf.d/<website name>.conf # copy config file and modify
docker compose exec nginx nginx -s reload # reload nginx
```

## create ssl certificate
```
certbot certonly --webroot --webroot-path /data/tmp/docker-compose/nginx/webroot/letsencrypt --domains <domain name>
```

## SSL certificate hardwired
```
ln -f /etc/letsencrypt/live/<domain name>/fullchain.pem ./cert/<domain name>.pem
ln -f /etc/letsencrypt/live/<domain name>/privkey.pem ./cert/<domain name>.key
```