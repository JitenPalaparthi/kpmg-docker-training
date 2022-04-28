# Docker

### Issues with docker command to run as root

    - https://docs.docker.com/engine/install/linux-postinstall/

### To get docker info

```docker info```

### To login to docker and use all docker hub features 

    - provide hub.docker.com userid and password.

```docker login``` 

### To pull an image

```docker pull ubuntu```

    - It checkes to which registry server docker has connected?
    - In this context docker has connected to hub.docker.com
    - Based on credentials it connects to hub.docker.com
    - It checks whether the image is already existed in host machine or not
    - Each image consists of various layers.
    - Each layer contains a Digest (SHA256)
    - If the SHA256 in local machine and the image it has to pull is same, then docker will not pull that particular layer.If not it pulls that layer.

### To list all images in the host machine

```docker images```

```docker image ls```

### To get history and other information about the image

```docker image history ubuntu```

```docker history ubuntu```

```docker image inspect ubuntu```

```docker inspect ubuntu```

### To create a container

```docker run ubuntu```

    - docker run name_of_the_container imagename/id command
    - name of the container: --name u1
    - name of the image: ubuntu
    - command: sleep 1000

```docker run --name u1 ubuntu sleep 1000```

    - run in interative tty mode

```docker -it --name u2 ubuntu bash```

    - run in detached mode

```docker run -d --name ng1 nginx```

    - run a container by publising a port

```docker run -d --namge ng2 -p 50080:80 nginx```


### Exec into a running container

```docker exec -it ng2 bash```

### To listdown running containers

```docker ps```

### To listdown all containers

```docker ps -a```

### To delete containers

```docker rm ng1```

```docker rm -f ng1```

### To delete all containers 

```docker rm -f $(docker ps -aq)```

### To stop a container

```docker stop ng1```

### To start a container which is stopped

```docker start ng1```

### To fetch logs of a container

```docker logs u1```

```docker logs -f u1```

## Docker network

### To list all networks

```docker network ls```

### To inspect a netwrok

```docker network inspect bridge```

### To create a netwrok 

```docker network crete mybridge1```

### To create a network with gateway and subnet

```docker network create mybridge2 --gateway 172.27.0.1 --subnet 172.27.0.0/16```

### To delete all networks (Not default)

```docker network prune```

### To delete a specific network 

```docker network rm mybridge1```

### To create a container with specific network

```docker run -d --name ng1 --network mybridge -p 50080:80 nginx```

## Docker volume

### To list volumes

```docker volume ls```

### To create a volume

```docker volume create myvolume```

### To delete a volume (on can if the volume is not used by any container)

```docker volume rm myvolume```

### create a container attaching volume

```docker run -d --name ng3 -p 50092:80 -v myvolume:/root nginx```

### TO Mount a Path using docker

```docker run -it --mount src="$(pwd)",target=/test_container,type=bind --name test ubuntu```

### Copy command from and to container

- copy from host to container 

```docker cp tempfile u1:/temp/```

- copy from container to host

```docker cp u1:/root .```


### Build container

- To build if the docker file name is Dockerfile

```docker build . -t jpalaparthi/myubuntu``` 

- To build image with tag

```docker build . -t jpalaparthi/myubuntu:v01```

### To push image to docker hub or any registered container registry

```docker push jpalaparthi/myubuntu```

- puch an image with tag

```docker push jpalaparthi/myubuntu:v01```

### Devops

- The application code to be copied to a container and that should be compiled on the container
- For simplicity we generate the binary and copy the binary to the container
- To cross compile , build generate binary in go
  - GOARCH=amd64 && GOOS=linux go build -o app main.go
