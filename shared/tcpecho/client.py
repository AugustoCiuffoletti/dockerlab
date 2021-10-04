import socket
host = raw_input('Scegli un host: ')
port = raw_input('Scegli una porta: ')
buflen = 80
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # Creazione del socket 
s.connect((host,int(port)))                            # Connessione (3-way handsake)
msg = raw_input('Stringa da spedire: ')
s.send(msg)                                            # Spedizione messaggio
data = s.recv(buflen)                                  # Attesa risposta
print('Stringa ricevuta: '+data)
s.close()                                              # Chiusura socket
