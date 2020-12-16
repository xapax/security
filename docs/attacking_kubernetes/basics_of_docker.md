


# Create image
You can define a docker-container by creating the file Dockerfile.
The Dockerfile is a configuration-file that specifies what should be running in the container.

A Container is a runtime instance of an image.


The `FROM` keyword is used to define from what base-image you want to build upon. You can choose anything available on dockerhub for example.

```
FROM debian:latest

```

After you have created a Dockerfile you need to build it to be able to run it. When you build it all the package inside the Dockerfile will be downloaded.


```
sudo docker build --tag nameofcontainer .
```

Now you can check out the 



