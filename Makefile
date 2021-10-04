test0:
	sudo docker run --rm hello-world
demo:
	docker run -it --rm ubuntu /bin/bash
server:
	sudo docker run -it --rm --volume ${PWD}/shared/:/shared psrlab:latest
build:
	sudo docker build -t psrlab:latest .
push:
	sudo docker tag psrlab:latest mastrogeppetto/psrlab:latest

