## 1. 克隆仓库
```
git clone https://github.com/W3Tools/docker-compose.git
```

## 启动mysql/postgres
```
cd {DB_NAME}
docker-compose up -d # pip3 安装的docker-compose
docker compose up -d # 需安装docker-compose-plugin插件

```

##### 安装docker-compose-plugin插件
```
apt-get install docker-compose-plugin # ubuntu
yum install docker-compose-plugin # centos
```