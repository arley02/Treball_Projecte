import psycopg2
def login(credenciales):
    
#demanar usuari i contrasenya per la conexio
    username = input("Introduïu el nom d'usuari: ")
    password = input("Introduïu la contrasenya: ")
    if username in credenciales:

#per ara la connexió es realitza amb un usuari amb permisos de la base de dades, Després es configura perquè els usuaris corresponents puguin llogar-se a la base de dades amb els rols que li toquen.
#en cas de tenir dades diferents com la IP o l'usuari i contrasenya canviar-la per assegurar la connexió
    #proba de conexio i de visualitzacio de dades.
        connexio = psycopg2.connect(host="10.94.254.116", dbname="HR",  user="postgres", password="Blanes2121")
        cur = connexio.cursor()
        cur.execute("SELECT * FROM departments;")  
        reg = cur.fetchone()
        lineas = len(("| {:<2} | {:<25} | {:<8} |".format(reg[0], reg[1], reg[2])))
        print("-"*lineas) 
        print("| {:<2} | {:<25} | {:<8} |".format("ID", "Departamento", "ID_Local"))
        print("-"*lineas) 

        while reg is not None: 
            print("| {:<2} | {:<25} | {:<8} |".format(reg[0], reg[1], reg[2]));  
            reg = cur.fetchone()
            print("-"*lineas)
    else:
        print("usuari o contraseña ")

#registre del usuari, falta configurar per asignar els rols
def registre(new_user, new_password):
    creacio_usuari = f"CREATE USER {new_user} WITH PASSWORD '{new_password}';"

    try:
        connexio = psycopg2.connect(host="192.168.56.112", dbname="HR", user="postgres", password="Blanes2121")
        cur = connexio.cursor()
        cur.execute(creacio_usuari)
        connexio.commit()

        cur.close()
        connexio.close()

    except Exception as e:
        print("Error en intentar crear l'usuari:", e)