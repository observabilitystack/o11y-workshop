# 📦 Spring Petclinic example application

The Spring framework provides a well know showcase named
_Petclinic_. It's a easy CRUD web application showcasing the
capabilities of the Spring Boot framework.

We created our [own fork of the project](https://github.com/observabilitystack/spring-petclinic). An up-to-date image
is available at

```
ghcr.io/observabilitystack/spring-petclinic:latest
```

### 🚚 Deploy the Petclinic

We prepared a _Docker Compose_ file for launching the Petclinic.

```
$ cd ~/o11y-workshop/spring-petclinic
$ docker-compose up -d
```

Connect to your Petclinic at [petclinic.PETNAME.workshop.o11ystack.org](https://petclinic.PETNAME.workshop.o11ystack.org).

![alt](../images/petclinic.png)

### Links

* [Spring Petclinic](https://github.com/spring-projects/spring-petclinic)
* [Additional features we added to the Petclinic](https://github.com/spring-projects/spring-petclinic/compare/main...observabilitystack:spring-petclinic:main)
