#! /bin/bash
##Copiamos toda la carpeta correspondiente al Front donde  se encuentra la carpeta con el ambiente de docker 
cp -r aik-front Infra/Docker/copy-aik-ui
echo "Se ha copiado la carpeta del FrontEnd a la carpeta de Infra donde se encuentra el ambiente docker"