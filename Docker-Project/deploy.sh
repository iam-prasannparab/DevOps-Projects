cd /opt/docker
docker stop mycontainer
docker rm mycontainer
docker rmi myimage
docker build -t myimage .
docker run -d -p 8085:8080 --name mycontainer myimage