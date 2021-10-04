import socket
port = raw_input('Su quale porta apri il servizio?> ')
queuelen = 5
buflen = 80
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)   # Creazione del socket
s.bind(('',int(port)))                                  # Collegamento alla porta
s.listen(queuelen)                                      # Predisposizione coda
try:
    while True:
        client, (remhost, remport) = s.accept()         # Attesa (3-way handshake)
        print ('Servizio attivo con '+remhost)
        data = client.recv(buflen)                      # Ricezione messaggio
        if data:
            client.send(data)                           # Spedizione messaggio
            print ('Stringa scambiata: '+data)
            client.close()                              # Chiusura socket
            print ('Servizio concluso')
except KeyboardInterrupt:
    print('*** Interruzione!')
