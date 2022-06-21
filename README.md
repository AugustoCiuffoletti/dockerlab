# dockerlab

Per realizzare gli esercizi è necessario installare sulla propria macchina
 alcune applicazioni. Sono applicazioni disponibili per tutti i sistemi operativi, largamente utilizzate, ben documentate e facili da disinstallare. Sono elencate di seguito con alcune brevi note sull'installazione e l'uso.

## Docker Desktop ([https://www.docker.com/get-started/](https://www.docker.com/get-started/))

E' una applicazizone che ci consente di virtualizzare un host di rete per osservare il funzionamento dei protocolli di comunicazione.

Al link indicato sopra trovate le istruzioni per l'installazione, diverse per i vari sistemi operativi: installate **Docker Desktop** (non Docker Hub). Al termine dell'installazione dovreste avere tra le aplicazioni Docker Desktop, caratterizzato da una icona che rappresenta una balena su fondo azzurro.

Avviando l'applicazione apparirà una finestra e l'icona nella cosiddetta **task bar**, in alto o in basso sullo schermo, dipendemente dalla configurazione.

Non dovrebbe essere necessario utilizzare l'interfaccia grafica, ma l'applicazione deve essere avviata per poter eseguire gli esercizi che richiedono i server virtualizzati. Quindi la finestra può essere subito chiusa, ma nella task-bar resterà presente l'icona. Per interrompere l'applicazione, nel menu collegato all'icona selezionate **Quit Docker Desktop**. Per accedere nuovamente alla dashboard selezionate **Dashboard**. Per svolgere le attività del corso **non** è necessario nessun tipo di sottoscrizione.

Per le attività di laboratorio utilizzeremo le funzionalità di **Docker Desktop** da linea di comando, utilizzando un emulatore di terminale (*command prompt* per Windows)

Al termine delle attività di laboratorio è opportuno interrompere l'applicazione, perchè impegna risorse del PC e può interferire con altre applicazioni.

Saltuariamente, la dashboard potrà esservi utile per rimuovere **containers** e immagini di disco (**images**), usando il menu a sinistra.

## Git ([https://git-scm.com/downloads](https://git-scm.com/downloads))

Git disponibile per tutti i principali sistemi operativi. Le sempllici istruzioni di installazione sono indicate al link.

E' un'applicazione a linea di comando (quindi si usa da emulatore di terminale) per gestire progetti software. E' uno strumento complesso ma prezioso nell'attività di sviluppo. Per l'attività di laboratorio lo utilizzeremo solo per semplificare l'operazione di download del materiale per le esercitazioni.

Dopo averlo installato potete subito provarlo per scaricare in locale queste istruzioni (e il materiale collegato), con il comando:

$ git clone https://github.com/AugustoCiuffoletti/dockerlab/

**Attenzione**: il comando da eseguire **non** comprende il $ iniziale, che viene inserito solo per indicare che si tratta di un comando da terminale da un account utente.

## make ([https://cmake.org/install/](https://git-scm.com/downloads))

Make è una applicazione a linea di comando che semplifica l'esecuzione di procedure di compilazione e configurazione. Sui sistemi Linux e Mac è molto semplice l'installazione del comando Unix originale, **make**, utilizzando gli installer di sistema (*brew* e *apt* rispettivamente). In Windows è più pratico utilizzare lo strumento derivato **cmake**, con funzionamento analogo, anche disponibile per Linux e Mac.  

- Wireshark (brew install wireshark)
- Ostinato
- geany

A momento è possibile creare il nodo server: all'interno trovate alcuni dei comandi necessari per svolgere gli esercizi. In particolare ping, ifconfig, traceroute ed nc.

Per creare il nodo server, operazione che si fa una singola volta, a meno che non vi dica che è stato aggiornato, il comando da digitare è

`$ make build`

se avete installato il tool "make". Installarlo non è difficile, ma se preferite farne a meno aprite il file "Makefile" copiate il comando "docker..." in corrispondenza a "build:" e mettetelo in riga di comando.

Per avviare un server il comando è

`$ make server1`

Come sopra, potete copiare il comando "docker..." dal makefile in corrispondenza a "run:".

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

La vostra directory home è vuota. La home dell'utente "user" è collegata alla directory "userHome" nel vostro PC. Le modifiche ai file che create in quella directory sono immediatamente visibili nel Docker e viceversa.

All'avvio della macchina siete utenti `user` nella directory home dell'utente "user". Potete invocare comandi con sudo: vi si chiederà la password di `user`, che è `user`.

Potete accedere al Docker anche tramite ssh dalla macchina fisica, utilizzando il comando ssh, o una applicazione in grado di realizzare un collegamento in ssh. L'indirizzo è quello corrispondente alla porta "eth0" ottenuta con ifconfig.

Oltre al Docker server1 avete anche a disposizione un secondo server, server2, e due Docker specializzati, rispettivamente lamp e flask.

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

Clonare il repository dell'esercizio nella directory userHome ed avviare due server (make server): il repository clonato sarà disponibile in ambedue le home degli utenti sui Docker. Invocare su un Docker il mittente, e sull'altro il destinatario. I pacchetti si catturano comunque con Wirehark sul sistema ospite, il vostro PC, perché la cattura è "promiscua".

## Analisi del protocollo DHCP

Non si riesce. Comunque dovrebbe essere possibile vedere i dhcp prodotti dal nodo stesso quando si connette/sconnette da una rete (Ethernet, Wireless)

## Analisi di una risposta DNS

Utilizzando Wireshark: avviare Wireshark, impostare il filtro "dns", azzerare la visualizzazione, fare un ping su www.example.com, fermare subito la cattura. Attenzione perchè di solito c'è una cache, quindi bisogna fare un refresh.

## Client/server TCP in Python

Come per UDP avviare due Docker e clonare il codice nella directory condivisa: su un Docker avviare il client, e sull'altro il server, secondo le istruzioni dell'esercizio.

## Trasferimento di un file con nc

Come sopra. Attenzione a trasferire il file in una directory diversa, ad esempio su /tmp, nel Docker destinatario del trasferimento.

## Configurazione accesso SSH con chiave

Avviare due docker e configurare l'accesso dall'uno all'altro, come indicato nelle trasparenze. In alternativa è anche possibile configurare l'accesso per chiave dalla macchina ospite.

## Configurazione server LAMP

Con "make lamp" avviate un docker che ospita un server composto da un web server (Apache), un database SQL (MySQL), e l'interprete PHP. Trivate la documentazione su https://hub.docker.com/r/mattrayner/lamp. Come per il docker "server" i dati di configurazione sono in una directory condivisa con l'host. La directory si chiama "web" e all'interno trovate la directory per la app ("app") e quella per il database ("mysql"). Nella directory "app" c'è il semplice file html per l'esercitazione. Ma lo strumento è completo e consente lo sviluppo di applicazioni web nello stile LAMP.

Per svolgere l'esercizio è necessario prima ottenere l'indirizzo IP del docker. Per questo collegate al Docker un terminale, con il comando

    $ sudo docker exec -it flask /bin/bash

Poi con il comando 

    $ cat /etc/hosts

ottenete una lista di indirizzi IP: quello del docker è in una rete privata, probabilmente nella 172.16.0.0/12.

Per raggiungere il server potete utilizzare questo indirizzo nel browser del vostro PC. Per modificare i contenuti potete editare i file nella directory "web/app" sul vostro PC. Per catturare il traffico potete utilizzare Wireshark sul vostro PC. Potete anche accedere al database MySQL con gli strumenti appropriati (Squirrel oppure riga di comando). La password dell'utente admin è mostrata durante i lprimo avvio: annotatela se volete utilizzare il database! In ogni momento potete cancellare la directory web/mysql, e il database verrà reinizializzato con una nuova password.

## Installazione di un servizio Flask

Con "make flask" avviate un docker che ospita un server che contiene al 

Compito - Laboratorio: creazione di una istanza su Heroku e installazione di un servizio"
