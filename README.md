# lisp-docker-base
lisp-docker-base is a base docker image which can be used for any services based on SBCL Common Lisp.
It has quicklisp and slynk installed and starts a slynk server on port 4005 when run.

## Building

Build the image in the usual way:

```
docker build -t registry.k8s.io/lisp-docker-base:1.0.0 --progress plain .
```

## Deploying and running on minikube

If you're using minikube for kubernetes development, upload the image like this:

```
minikube image load registry.k8s.io/lisp-docker-base:1.0.0 
```

Then you can start a pod like this:

```
kubectl run lisp-docker-base --image=registry.k8s.io/lisp-docker-base:1.0.0 --port=4005 --leave-stdin-open=true -i --attach=false
```

Now forward port 4005 to your local machine:

```
kubectl port-forward lisp-docker-base 4005:4005 &
```

And you're finally ready to connect your Emacs REPL using `M-x sly-connect`.
