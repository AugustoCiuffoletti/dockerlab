import socket, sys
if len(sys.argv) != 3:                                        # Controllo parametri
  print('\nUsage: '+sys.argv[0]+' <local_IP> <local_port\n')
  exit(1)
local_IP=sys.argv[1]                                          # Acquisizione parametri
local_Port=int(sys.argv[2])
target = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)     # Creazione socket
target.bind((local_IP,local_Port))                            # Associazione a porta e interfaccia 
data, source = target.recvfrom(400)                           # Attesa e ricezione
print data, "from", source                                    # Stampa
