import bcrypt
import openpyxl
from os import system
from encriptacion import *
from conexion import *
x = " "
while x != "0":

    # Selecció del mode: iniciar sessió o crear un nou compte

    mode = input("Seleccioneu el mode:\n 1 - Iniciar sessió\n 2 - Crear un compte\n 0 - Sortir \n \n  Seleccione una opcio: ")

    if mode == "1":
        system("cls")
        login(credentials)
    elif mode == "2":
        system("cls")
        new_username = input("Introduïu el nou nom d'usuari: ")
        new_password = input("Introduïu la nova contrasenya: ")
        datos_encript(file_path, new_username, new_password)
        registre(new_username, new_password)
        system("cls")
        print("El compte s'ha creat amb èxit!")
    elif mode == "0":
        system("cls")
        print("Sortint del sistema")
        x = "0"
    else:
        print("Mode incorrecte. Si us plau, seleccioneu 1 o 2.")