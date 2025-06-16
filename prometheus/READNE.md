# 1. Create directories to store data for prometheus and grafana

```
mkdir ./data/grafana ./data/prometheus
```

# 2. Change ownership of directories

```
chown -R 472:472 ./data/grafana && chown -R 65534:65534 ./data/prometheus
```
