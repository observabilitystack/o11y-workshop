# Java Flight Recorder

## Prerequisites

Download [JDK Mission Control](https://www.oracle.com/java/technologies/javase/products-jmc8-downloads.html)
to your Laptop

## Create a flight recording

```bash
docker exec -it spring-petclinic-petclinic-1 bash
JAVA_TOOL_OPTIONS="" jcmd $(pgrep java) JFR.start name=profile duration=60s filename=current.jfr settings=profile
JAVA_TOOL_OPTIONS="" jcmd $(pgrep java) JFR.check
```

```bash
docker cp spring-petclinic-petclinic-1:/current.jfr ~/$(hostname)-$(date '+%Y-%m-%d_%H-%M-%S').jfr
```

Now transfer onto your laptop for further analysis
