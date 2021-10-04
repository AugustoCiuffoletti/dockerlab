server:
	sudo docker run --rm -a stdin -a stdout -i -t --volume ${PWD}/shared/:/shared psrlab:latest
build:
	sudo docker build -t psrlab:latest .
push:
	sudo docker tag psrlab:latest mastrogeppetto/psrlab:latest

