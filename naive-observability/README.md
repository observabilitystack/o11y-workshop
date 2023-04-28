# 🧐 Naive observability


```
$ cd ~/o11y-workshop/spring-petclinic
$ docker-compose up -d
```

```
hey -n 20000 -c 300 "https://petclinic.credible-alpaca.workshop.o11ystack.org/owners?lastName=$(hostname)"
```

```
docker stats
```

```
top
```

> Maybe add explicit bugs (temp files, memory leak) via
> `WebFilter` in Petclinic?
