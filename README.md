# hello-kube-nodejs-on-arm

This is just a simple nodejs app as described on the [hello minikube documentation](https://kubernetes.io/docs/tutorials/hello-minikube/).

Modified only so it can run on a raspberry pi 3: `FROM arm32v7/node:11`

The image `welshstew/hello-kube-nodejs-on-arm:1.0` has been pushed and is [available on dockerhub](https://cloud.docker.com/repository/docker/welshstew/hello-kube-nodejs-on-arm).

__server.js__
```server.js
var http = require('http');

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  response.end('Hello World!');
};
var www = http.createServer(handleRequest);
www.listen(8080);
```

__Dockerfile__

```text
FROM arm32v7/node:11
EXPOSE 8080
COPY server.js .
CMD node server.js
```

## Build

```text
docker build . -t welshstew/hello-kube-nodejs-on-arm:1.0
```

## Run

```text
kubectl create deployment hello-nodejs --image=welshstew/hello-kube-nodejs-on-arm:1.0
```

