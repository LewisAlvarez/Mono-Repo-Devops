#! /bin/bash
#Ya que nos encontramos en la carpeta Infra (Infraestructura) debemos pararnos en la carpeta principal del proyecto, ProyectoDevops para realizar las copias
cd ..
##Copiamos toda la carpeta correspondiente al Front donde  se encuentra la carpeta con el ambiente de docker 
cp -r aik-front Infra/Docker/copy-aik-ui
echo "Se ha copiado la carpeta del FrontEnd a la carpeta de Infra donde se encuentra el ambiente docker"
##Copiamos toda la carpeta correspondiente al Back donde  se encuentra la carpeta con el ambiente de docker
cp -r aik-back Infra/Docker/copy-aik-back
echo "Se ha copiado la carpeta del BackEnd a la carpeta de Infra donde se encuentra el ambiente docker"

#Ahora en este mismo script construiremos las imágenes tanto para el front como para el back
#Nos paramos en la carpeta donde se encuentran los dockerfile
cd Infra/Docker
#Cambiamos el nombre del dockerfile-back a Dockerfile
#mv Dockerfile-back Dockerfile
#echo "El nombre del dockerfile-back ha sido cambiado"
#Ahora construimos la imagen correspondiente al back
sudo docker build -t aik-back:1.0 -f back.Dockerfile .
echo "La imagen docker del backend ha sido construida"

#Ahora procedemos a hacer lo mismo con el front
#Le volvemos a cambiar el nombre a la imagen del back a su nombre original
#mv Dockerfile Dockerfile-back
#Cambiamos el nombre del dockerfile-front a Dockerfile
#mv Dockerfile-front Dockerfile
#Construimos la imagen correspondiente al front
sudo docker build -t aik-front:1.0 -f front.Dockerfile .
echo "La imagen docker del frontend ha sido construida"
#Asignamos de nuevo el nombre por defecto de la imagen del front
#mv Dockerfile Dockerfile-front

#Termina el proceso...
echo "Las imagenes docker del front y back han sido construidas satisfactoriamente¡"
#Eliminamos las carpetas copiadas temporalmente a la carpeta Infra/Docker
rm -rf copy-aik-back
rm -rf copy-aik-ui
echo "Se eliminaron los directorios temporales"

#Configuración del Terraform
cd ..
cd conf_Terraform

terraform init
terraform apply -auto-approve
