import socket, sys
if len(sys.argv) != 3:                                        # Controllo parametri
  print('\nUsage: '+sys.argv[0]+' <remote_IP> <remote_port\n')
  exit(1)
remote_IP=sys.argv[1]                                         # Acquisizione parametri
remote_Port=int(sys.argv[2])
source = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)     # Creazione socket
source.sendto("Hallo", (remote_IP,remote_Port))               # Invio
