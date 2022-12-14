# 🛬 Java Flight Recorder

The Java flight recorder (JFR) is a great tool to gather extensive insights into
a running Java JRE. It's free and is shipped along every recent JDK (11+). The
observability process here has two steps

1. Record a Java Flight Recording of an application for given timeframe (e.g. 60s)
2. Analyze the recording using [JDK Mission Control](https://www.oracle.com/java/technologies/javase/products-jmc8-downloads.html)


![alt](../images/jdk-flight-recorder.png)

## 📼 Create a flight recording

You have to create the recording inside the running Docker container.

```bash
docker exec -it spring-petclinic-petclinic-1 bash
JAVA_TOOL_OPTIONS="" jcmd $(pgrep java) JFR.start name=profile duration=60s filename=current.jfr settings=profile
JAVA_TOOL_OPTIONS="" jcmd $(pgrep java) JFR.check
```

Then, move it outside the Docker container on to the host system.

```bash
docker cp spring-petclinic-petclinic-1:/current.jfr \
    ~/o11y-workshop/java-flight-recorder/$(hostname)-$(date '+%Y-%m-%d_%H-%M-%S').jfr
```

From here you can download the file via VSCode (`Right click -> Download`).

## ✨ Analyze a flight recording

Install [JDK Mission Control](https://www.oracle.com/java/technologies/javase/products-jmc8-downloads.html) on your local laptop. Open the downloaded JFR recording with _JDK Mission Control_.
