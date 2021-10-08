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

`$ make build`

se avete installato il tool "make". Installarlo non è difficile, ma se preferite farne a meno aprite il file "Makefile" copiate il lungo comando "docker..." in corrispondenza a "build:" e mettetelo in riga di comando.

Per avviare il server il comando è: 

`$ make server`

Come sopra, potete copiare il lungo comando "docker..." dal makefile in corrispondenza a "run:".

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

La vostra directory home è vuota. Una directory /shared è collegata alla directory "shared" nel vostro PC. I file che create in quella directory sono immediatamente visibli nel Docker e viceversa.

All'avvio della macchina siete utenti `user` nella directory home dell'utente "user". Potete invocare comandi con sudo: vi si chiederà la password di `user`, che è `user`.

Potete accedere al Docker anche tramite ssh dalla macchina fisica, utilizzando il comando ssh, o una applicazione in grado di realizzare un collegamento in ssh. L'indirizzo è quello corrispondente alla porta "eth0" ottenuta con ifconfig.

# Svolgimento dei laboratori

## Analisi pacchetti ping con Wireshark

Possibile intallando Wireshark [INST] sulla macchina fisica e utilizzando un terminale. Screenshot normali.

## Forgiare un pacchetto PING con PackETH

PackETH è un software disponibile solo su Linux. Mi pare che "Ostinato" [INST] possa funzionare bene, ma bisogna rifare un po' di screenshot. Poi serve Wireshark, già detto.

## Cattura di pacchetti ARP con Wireshark

Attenzione, "arp -d" non funziona, però la tabella MAC del docker appena avviato è vuota. Quindi basta fare un ping dal docker verso la macchina ospite (172.17.0.1) e il pacchetti desiderati appaiono

## Forgiare pacchetti per Virtual LAN

Come per forgiare pacchetti PING

## Produzione ed analisi di pacchetti UDP

Avviare due server (make server) e connetterli come indicato con VirtualBox. pacchetti si catturano comunque con Wirehark, anche se la macchina ospite non è il destinatoraio finale, perché la cattura è "promiscua".

## Analisi del protocollo DHCP

Non si riesce. Comunque dovrebbe essere possibile vedere i dhcp prodotti dal nodo stesso quando si connette/sconnette da una rete (Ethernet, Wireless)

## Analisi di una risposta DNS

Utilizzando Wireshark: avviare Wireshark, impostare il filtro "dns", azzerare la visualizzazione, fare un ping su www.example.com, fermare subito la cattura. Attenzione perchè di solito c'è una cache, quindi bisogna fare un refresh.

:"Compito - Laboratorio: Client/server TCP in Python
Compito - Laboratorio: Trasferimento di un file con nc
Compito - Laboratorio: Configurazione accesso SSH con chiave
Compito - Laboratorio: configurazione server LAMP
Compito - Laboratorio: installazione di un servizio Flask
Compito - Laboratorio: creazione di una istanza su Heroku e installazione di un servizio"
