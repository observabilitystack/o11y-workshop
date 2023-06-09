# 😰 Stress testing the Petclinic

> 🤡 Now the fun part begins, let's stress test our petclinic fully instrumented and
> check the difference in visibility and observability!

### 🚀 Load Test

Run a load on your petclinic by executing
```
hey -n 40000 -c 150 "https://petclinic.$(hostname).workshop.o11ystack.org/owners?lastName=$(hostname)"
```

### 🐞 It's a feature, not a bug

We prepared some endpoints to activate and deactivate a certain buggy behavior within your petclinic.
Try to activate some and let's execute the load test again...

```
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/memory"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/cpu"
curl "https://petclinic.$(hostname).workshop.o11ystack.org/bugs/locking"
```
