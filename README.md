# 🔎 (Open Source) Observability Test Drive Workshop

> 📍 DevOpsCon Berlin 2023

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

### 📦 [Deploy the example application](spring-petclinic/README.md)

We are going to use the Spring Petclinic application as our test
application.

### 📦 [Naive observability](spring-petclinic/README.md)

What native tools do we have on our machine to get an overview
what's going on?

### 🪡 [Prometheus & Grafana](prometheus-grafana/README.md)

This candidate is very close to a self-hosted open source experience.
We are going to host a Prometheus instance ourselves but leverage the
Grafana Cloud for displaying dashboards, metrics and traces.

### 🛬 [Java Flight Recorder](java-flight-recorder/README.md)

The Java Flight Recorder ships along recent JDKs, is free and
offers spectacular insights into a running (or crashed) Java
application.

### 🦆 [Elastic Stack](elastic/README.md)

The Elastic Stack is a well known for it's log analysis capabilities.
But there's more! We'll leverage a Trial Elastic Cloud offering for this
test drive.
