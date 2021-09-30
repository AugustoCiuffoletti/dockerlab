# dockerlab

A momento è possibile creare un nodo server: all'interno trovate alcuni dei comandi necessari per svolgere gli esercizi. In particolare ping, ifconfig, traceroute ed nc.

Il server lo aprite con il comando "make server" se avete installato il tool "make". Installarlo non è difficile, ma se preferite farne a meno aprite il file "Makefile" copiate il lungo comando "docker run" e mettetelo in riga di comando.

Il comando attualmente è: 

sudo docker run -a stdin -a stdout -i -t mastrogeppetto/psrlab:latest --volume $(pwd)/userHome/:/home/user/ /bin/bash

Il prompt della linea di comando cambia e siete nel server: provate a controllare con ifconfig, dovreste avere una interfaccia eth0: annotate l'ip.

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:02  txqueuelen 0  (Ethernet)
        RX packets 20  bytes 2963 (2.9 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

La vostra directory home è vuota, ed è collegata alla directory "userHome" nel vostro PC. I file che create in quella directory sono immediatamente visibli nel Docker, virtuale.

Al momento dovete installare il software grafico. Al momento è necessario solo Wireshark, ma oggi vi parlerò anche di PackETH, che credo sia disponibile solo per Linux. Potete provare "ostinato" (https://ostinato.org/) 

