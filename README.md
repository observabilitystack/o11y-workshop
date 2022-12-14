# 🔎 (Open Source) Observability Test Drive Workshop

> 📍 DevOpsCon Munich 2022

This is the code and slides we'll be using during our observability
workshop.

## 👴🏻 Observability theory

TBD

## 🔬 Your test laboratory instance

Getting started with [your own lab instance](lab-instance.md).

![alt](images/lab-instance.png)

## 🏎️ Test drive observability suites

We are going to give several observability suites a test drive. We'll
integrate

* _APM (application performance monitoring) a.k.a. Tracing_
* _Metrics_
* _Logs_
* _Uptime monitoring_

We are going to use SaaS cloud offerings as far as possbile and
feasable.

### 📦 [Build and deploy the example application](spring-petclinic/README.md)

We are going to use the Spring Petclinic application as our test
application.

### 🪡 [Prometheus & Grafana](prometheus-grafana/README.md)

This candidate is very close to a self-hosted open source experience.
We are going to host a Prometheus instance ourselves but leverage the
Grafana Cloud for displaying dashboards, metrics and traces.

### 🦆 [Elastic Stack](elastic/README.md)

The Elastic Stack is a well known for it's log analysis capabilities.
But there's more! We'll leverage a Trial Elastic Cloud offering for this
test drive.

### 💰 [New Relic](newrelic/README.md)

New Relic was one of the first APM SaaS solutions available and has
a great reputation. We'll leverage their free trial.

### 🛬 [Java Flight Recorder](java-flight-recorder/README.md)

The Java Flight Recorder ships along recent JDKs, is free and
offers spectacular insights into a running (or crashed) Java
application.

### 🐝 [Honeycomb](honeycomb/README.md)

Honeycomb is the company behind some of the authors of
_Observability Engineering_.
