# Docker Jenkins V2

## Build

```
$ docker build -t jenkins:v2.0 .
```

## Run

```
$ docker run -d -v /path/to/jenkins:/var/lib/jenkins -p 8080:8080 jenkins:v2.0
```

