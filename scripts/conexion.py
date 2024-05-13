import psycopg2
from psycopg2 import OperationalError
from os import system
from consultas_i_informes import *
def login(credenciales):
    
#demanar usuari i contrasenya per la conexio
    username = input("Introduïu el nom d'usuari: ")
    password = input("Introduïu la contrasenya: ")
    system("cls")
    try:
        conn = psycopg2.connect(host="192.168.0.28", dbname="hospital", user=username, password=password)
        x = " "
        while x != "4":
            print("-"*20)
            print("Menu Gestio Hospital")
            print("-"*20)
            print("\n 1 . Manteniments\n 2 . Consultes i informes\n 3 . Exportacio de dades\n 4 . Sortir\n\n")
            x = input("Entra una opcio: ")
            if x == "1":
                pass
            elif x == "2":
                system("cls")
                menu_consultas(username, password)
            elif x == "3":
                pass
            elif x == "4":
                system("cls")
                print("-"*20)
                print("session cerrada")
                print("-"*20)

        conn.close()
    except OperationalError as e:
        # Si hay un error al conectarse, imprime un mensaje indicando el error
        print("-"*20)
        print(f"Error al conectar al servidor PostgreSQL: {e}")
        print("-"*20)
      

#registre del usuari, falta configurar per asignar els rols
def registre(new_user, new_password):
    creacio_usuari = f"CREATE USER {new_user} WITH PASSWORD '{new_password}';"

    try:
        connexio = psycopg2.connect(host="10.94.254.116", user="postgres", password="Blanes2121")
        cur = connexio.cursor()
        cur.execute(creacio_usuari)
        connexio.commit()

        cur.close()
        connexio.close()
    except Exception as e:
        print("Error en intentar crear l'usuari:", e)