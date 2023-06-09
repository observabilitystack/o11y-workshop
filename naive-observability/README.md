# 🧐 Naive observability

What can we observe without further instrumentation?

Deploy the petclinic
```
$ cd ~/o11y-workshop/spring-petclinic
$ docker-compose up -d
```

### 🚀 Load Test

Run a load on your petclinic by executing
```
hey -n 20000 -c 300 "https://petclinic.$(hostname).workshop.o11ystack.org/owners?lastName=$(hostname)"
```

### 🔎 Observe

Open a second shell and lets see what we can find out
```
docker stats
docker logs [CONTAINER_ID]
htop
dmesg
```

### 🐞 It's a feature, not a bug

We prepared some endpoints to activate and deactivate a certain buggy behavior within your petclinic.
Try to activate some and let's execute the load test again...
```
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/memory"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/cpu"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/locking"
```
