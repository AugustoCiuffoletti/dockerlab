server:
	sudo docker run -a stdin -a stdout -i -t --volume $(pwd)/userHome/:/home/user/ mastrogeppetto/psrlab:latest  /bin/bash

