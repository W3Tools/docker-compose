##  Install docker(安装docker)
```bash
# centos
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-compose-plugin # docker-compose-plugin for use <docker compose>
```

## Clone the docker-compose repo(克隆docker-compose仓库)
```
git clone https://github.com/W3Tools/docker-compose.git
```

## 1. Start mysql/mysql8.0(启动mysql/mysql8.0)
```bash
#  Switch to mysql dir(切换到mysql目录)
cd mysql # or cd mysql8

# Edit the env file(修改.env文件)
vi .env

# Start docker compose(启动docker compose)
docker compose up -d
```

## 2. Start cluster(启动mysql集群)
```bash
# Switch to mysql cluster dir(切换到mysql cluster目录)
cd mysql8-cluster

# Edit the env file(修改.env文件)
vi .env

# Start docker compose(启动docker compose)
docker compose up -d
```

## 3. Start postgres(启动postgres)
```bash
# Switch to postgres dir(切换到postgres目录)
cd postgres

# Edit the env file(修改.env文件)
vi .env

# Start docker compose(启动docker compose)
docker compose up -d
```

## 4. Start redis(启动redis)
```bash
# Switch to redis dir(切换到redis目录)
cd redis

# Edit the env file(修改.env文件)
vi .env

# Edit the redis.conf config file(修改redis.conf配置文件)
vi redis.conf

# Start docker compose(启动docker compose)
docker compose up -d
```

## 5. Start gogs(启动gogs)
```bash
# Switch to gogs dir(切换到gogs目录)
cd gogs

# Edit the env file(修改.env文件)
vi .env

# Start docker compose(启动docker compose)
docker compose up -d
```