docker run --name go-build -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) -v `pwd`:/home/share -ti marklarter/go-build
