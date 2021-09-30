server:
	sudo docker run -a stdin -a stdout -i -t --volume ${PWD}exit/userHome/:/home/user/ mastrogeppetto/psrlab:latest  /bin/bash

