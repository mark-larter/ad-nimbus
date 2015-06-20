# run the build container.
docker run --name go-build -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) -v `pwd`:/home/share -ti marklarter/go-build

# run the go app.
docker run -d -p=49160:8080 --name helloWorld marklarter/helloworld-go
docker run -d -p=49161:8080 --name netLocation marklarter/netlocation-go
