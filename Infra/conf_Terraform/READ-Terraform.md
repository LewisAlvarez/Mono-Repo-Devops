Esta es la carpeta de configuración de Terraform

1. Previamente a desplegar la infraestructuras se debe haber correr el script build-docker.images.sh
2. El archivo principal main.tf, lo primero que se realiza es un mapeo de atributos de los atributos del FrontEnd y el BackEnd, despues se cargan las imagenes creadas anteriormente con el script script build-docker.images.sh, por ultimo se definen los puertos del contenedor tanto por el que escucha como el de la maquina host. Los puertos estan definidos en el archivo terraform.tfvars


