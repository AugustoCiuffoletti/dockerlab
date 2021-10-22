.PHONY: test0 demo server build push lamp flask

test0:
	sudo docker run --rm hello-world
demo:
	sudo docker run -it --rm ubuntu /bin/bash
server1:
	sudo docker run --name server1 -it --rm --volume ${PWD}/shared1/:/shared psrlab:latest
server2:
	sudo docker run --name server2 -it --rm --volume ${PWD}/shared2/:/shared psrlab:latest
build:
	sudo docker build -t psrlab:latest .
push:
	sudo docker tag psrlab:latest mastrogeppetto/psrlab:latest
lamp:
	sudo docker run --name lamp -it --rm -p "80:80" -p 3306:3306 -v ${PWD}/web/app:/app -v ${PWD}/web/mysql:/var/lib/mysql mattrayner/lamp:latest
flask:
	sudo docker run --name flask -it --rm -p 80:80 -v ${PWD}/flask:/app -d jazzdd/alpine-flask
