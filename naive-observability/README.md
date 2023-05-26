# 🧐 Naive observability


```
$ cd ~/o11y-workshop/spring-petclinic
$ docker-compose up -d
```

```
hey -n 20000 -c 300 "https://petclinic.$(hostname).workshop.o11ystack.org/owners?lastName=$(hostname)"
```

```
docker stats
```

```
top
```

> Maybe add explicit bugs (temp files, memory leak) via
> `WebFilter` in Petclinic?

```
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/memory"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/cpu"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/locking"
```
