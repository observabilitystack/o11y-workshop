# 🧐 Naive observability

What can we observe without further instrumentation?

Deploy the petclinic
```
$ cd ~/o11y-workshop/spring-petclinic
$ docker-compose up -d
```

### 🚀 Load Test

Open a second shell and run a load test with
```
hey -n 20000 -c 300 "https://petclinic.$(hostname).workshop.o11ystack.org/owners?lastName=$(hostname)"
```

### 🔎 Observe

Lets see what we can find out
```
docker stats
docker logs ${container id}
htop
```

### 🐞 Provoke a bug

Choose one (or more) commands to provoke a bug and repeat the above points.
```
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/memory"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/cpu"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/locking"
```

