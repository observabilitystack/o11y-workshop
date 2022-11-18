# New Relic integration

```bash
export NEW_RELIC_LICENSE_KEY="eu01xx73..."
```

## Java application agent

```
curl -sLfo /tmp/newrelic-java.zip https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip
sudo unzip /tmp/newrelic-java.zip -d /usr/local/share
```

```yaml
environment:
  - NEW_RELIC_APP_NAME="petclinic"
  - NEW_RELIC_LICENSE_KEY="${NEW_RELIC_LICENSE_KEY}"
  - NEW_RELIC_LOG_FILE_NAME=STDOUT
  - JAVA_TOOL_OPTIONS="-javaagent:/usr/local/share/newrelic/newrelic.jar"
volumes:
  - /usr/local/share/newrelic:/usr/local/share/newrelic
```

# System & infrastructure agent

```
echo "license_key: ${NEW_RELIC_LICENSE_KEY}" | sudo tee -a /etc/newrelic-infra.yml
curl -s https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -
printf "deb https://download.newrelic.com/infrastructure_agent/linux/apt bullseye main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list
sudo apt-get update
sudo apt-get install newrelic-infra -y
```

## Postgres integration

```
sudo apt-get install nri-postgresql -y
sudo cp /etc/newrelic-infra/integrations.d/postgresql-config.yml.sample /etc/newrelic-infra/integrations.d/postgresql-config.yml
sudo sed -i 's/USERNAME: postgres/USERNAME: petclinic/g' /etc/newrelic-infra/integrations.d/postgresql-config.yml
sudo sed -i "s/PASSWORD: 'pass'/PASSWORD: petclinic/g" /etc/newrelic-infra/integrations.d/postgresql-config.yml
sudo sed -i 's/HOSTNAME: psql-sample.localnet/HOSTNAME: localhost/g' /etc/newrelic-infra/integrations.d/postgresql-config.yml
sudo sed -i 's/PORT: "6432"/PORT: "5432"/g' /etc/newrelic-infra/integrations.d/postgresql-config.yml
sudo sed -i 's/# DATABASE: postgres/DATABASE: petclinic/g' /etc/newrelic-infra/integrations.d/postgresql-config.yml
systemctl restart newrelic-infra.service
```

# Remove New Relic

```
sudo apt-get remove -y newrelic-infra nri-postgresql
```
