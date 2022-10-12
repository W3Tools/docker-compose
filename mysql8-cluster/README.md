# Master
### Create Synchronizer User
```bash
CREATE USER 'slave-user'@'%' IDENTIFIED WITH 'mysql_native_password' BY 'slave-password'; 
```

### Granting Permissions
```bash
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* to 'slave-user'@'%';
```

### Refresh Permissions
```bash
FLUSH PRIVILEGES;
```

### Check Master Status
```bash
SHOW MASTER STATUS;
```

# Slave
### Set Master
```bash
CHANGE MASTER TO
MASTER_HOST='mysql-master',
MASTER_USER='slave-user',
MASTER_PASSWORD='slave-password',
MASTER_LOG_FILE='mysql-bin.000003',
MASTER_LOG_POS=1592;
```

### Start Sync
```bash
START SLAVE;
```

### Check Slave Status
```bash
SHOW SLAVE STATUS \G;
```