# dockerlab

Per realizzare gli esercizi è necessario installare sulla propria macchina il codice seguente:

- docker (brew cask install docker)
- git (brew install git)
- make (brew install make)
- Wireshark (brew install wireshark)
- Ostinato
- geany

A momento è possibile creare il nodo server: all'interno trovate alcuni dei comandi necessari per svolgere gli esercizi. In particolare ping, ifconfig, traceroute ed nc.

Per creare il nodo server, operazione che si fa una singola volta, a meno che non vi dica che è stato aggiornato, il comando da digitare è

$ make build

se avete installato il tool "make". Installarlo non è difficile, ma se preferite farne a meno aprite il file "Makefile" copiate il lungo comando "docker run" e mettetelo in riga di comando.

Per avviare il server il comando è: 

$ make server  

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

La vostra directory home è vuota. Una directory /shared è collegata alla directory "shared" nel vostro PC. I file che create in quella directory sono immediatamente visibli nel Docker, virtuale e viceversa.
