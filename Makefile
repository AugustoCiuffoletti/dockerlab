server:
	sudo docker run -a stdin -a stdout -i -t mastrogeppetto/psrlab:latest --volume $(pwd)/userHome/:/home/user/ /bin/bash

