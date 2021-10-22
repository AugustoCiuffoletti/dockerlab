import time              # Importazione di una libreria con funzioni speciali
n=1                      # Dichiarazione di una variabile
l=("","Uno","Due","Tre") # Dichiarazione di una t-upla (l'indice del primo elemento e' 0)
while n<=3:              # Inizio un ciclo (controllato con n)
    print(l[n])          # Stampo il valore della tupla al posto n
    n=n+1                # Incremento la variabile di controllo
    time.sleep(1)        # Attesa...
print("Stella!")         # Uscita dal ciclo
