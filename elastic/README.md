# Elastic Cloud

* Sign up for Elastic Cloud
* [Log into Elastic Cloud](https://cloud.elastic.co/)

## Java APM

Download the Elastic Java Agent

```
sudo mkdir -p /usr/local/share/elastic
sudo curl -sLfo /usr/local/share/elastic/elastic-apm-agent.jar https://repo1.maven.org/maven2/co/elastic/apm/elastic-apm-agent/1.34.1/elastic-apm-agent-1.34.1.jar
```

Configure secrets

../instance-metadata.sh > .env
echo "ELASTIC_APM_SERVER_URL=https://c42c9[...].apm.europe-west3.gcp.cloud.es.io:443" >> .env
echo "ELASTIC_APM_SECRET_TOKEN=MG2[...]"  >> .env

Configure Petclinic

```yaml
environment:
  - ELASTIC_APM_SERVICE_NAME=petclinic
  - ELASTIC_APM_SERVER_URL=${ELASTIC_APM_SERVER_URL}
  - ELASTIC_APM_SECRET_TOKEN=${ELASTIC_APM_SECRET_TOKEN}
  - ELASTIC_APM_SERVICE_NODE_NAME=${HOSTNAME}
  - ELASTIC_APM_ENVIRONMENT=production
  - ELASTIC_APM_APPLICATION_PACKAGES=org.springframework.samples.petclinic
  - ELASTIC_APM_HOSTNAME=${HOSTNAME}
  - JAVA_TOOL_OPTIONS="-javaagent:/usr/local/share/elastic/elastic-apm-agent.jar"
volumes:
  - /usr/local/share/elastic:/usr/local/share/elastic
```

## Metrics

Configure secrets

```
cd ~/o11y-workshop/elastic
../instance-metadata.sh > .env
echo "ELASTIC_FLEET_HOST=https://848bf4[...].fleet.europe-west3.gcp.cloud.es.io:443" >> .env
echo "ELASTIC_FLEET_ENROLLMENT_TOKEN=SGsz[...]" >> .env
"ELASTIC_CLOUD_ID=[...]" >> .env
echo "ELASTIC_CLOUD_USER=elastic" >> .env
echo "ELASTIC_CLOUD_PASSWORD=rY7F[...]" >> .env
```

Make secrets available in the current terminal

```
set -a; source .env; set +a
```

Install Elastic agent

```
curl -sL -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.5.1-amd64.deb
sudo dpkg -i elastic-agent-8.5.1-amd64.deb
sudo elastic-agent enroll --url=${ELASTIC_FLEET_HOST} --enrollment-token=${ELASTIC_FLEET_ENROLLMENT_TOKEN}
sudo systemctl enable elastic-agent
sudo systemctl start elastic-agent
```

- Postgres-Integration
- Docker Metrics
- Docker Logs


/var/lib/docker/containers/*/*-json.log

```yaml
- decode_json_fields:
    fields: ["message"]
    target: ""
    overwrite_keys: true
    add_error_key: true
- add_host_metadata: ~
- add_cloud_metadata: ~
- add_docker_metadata: ~
```

## Heartbeat (uptime monitoring)

```
echo "GROUP_ID=$(id -g)" >> .env
echo "USER_ID=$(id -u)" >> .env
chown 1000 rootfs/etc/beats/heartbeat.yaml
docker-compose -f docker-compose-heartbeat.yaml up
```


## Uninstall

dpkg -P elastic-agent
