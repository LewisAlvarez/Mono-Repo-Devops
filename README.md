# Mono-Repo-Devops
Proyecto de Devops 2020.2, Trunk Base

Para la ejecución del proyecto en el estado actual se debe realizar lo siguiente:

1) Tener docker previamente instalado
2) Ingresar a superusuario o agregar su usuario para ser ejecutado con docker sin sudo.
3) Dar permisos al script script-copy.sh "chmod +x script-copy.sh"
4) Ejecutar el script ./script.sh

El script contruye las imagenes docker tanto para el front como para el back.
Las imagenes tienen el nombre para esta version:
Para el front: aik-front:1.0
Para el back: aik-back:1.0

.....
5) Debería continuar lo de terraform (TO DO)

Current State
![Current state](images/3.png)

![Current state](images/2.png)

Desired State
![Desired state](images/1.png)
