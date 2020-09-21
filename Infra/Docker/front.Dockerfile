#This is the Dockerfile to run Front-End
#Partimos de la última imágen de node
FROM node:latest
#LABEL lewis040@hotmail.es
#Copiamos la aplicación a un directorio dentro dl container
COPY copy-aik-ui /app
#Nos paramos en el directorio donde realizamos la copia
WORKDIR /app
#Instalamos el gestor de paquetes de node npm
RUN npm install
#Esponemos el puerto de comunicación
EXPOSE 3030
#Iniciar el server
CMD ["node","server"]

