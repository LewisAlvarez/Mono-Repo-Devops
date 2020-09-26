#Configuración para crear los contenedores de docker usando terraform
#Nomenclatura --> resource <PROVIDER> <TYPE> <NAME>
provider "docker"{

}

#Para correr el contenedor del FrontEnd, realizamos un mapeo de atributos de docker con terraform
#Cargamos las imagenes creadas con el script
#Para correr un contenedor en background se debe escribir attach=false
#La definición de puertos se hace tanto Interna como Externa, uno es el puerto por donde escuchará el contenedor y el otro es el puerto de la maquina host
resource "docker_container" "FrontEnd"{
    image = docker_image.image_frontEnd.latest
    name = "Container_FrontEnd"
    attach = false
    ports {
        internal = var.port_frontend
        external = var.port_frontend
    }
}

#Realizamos el mismo procedimiento para correr el contenedor del back, pero con sus parametros.
resource "docker_container" "BackEnd"{
    image = docker_image.image_backEnd.latest
    name = "Container_BackEnd"
    attach = false
    ports {
        internal = var.port_backend
        external = var.port_backend
    }
}

#Creamos el recurso que nos carga la imagen previamente contruida por el script build-docker.images.sh
#Esto sirve para "Inicializar la imagen que se llama al momento de crear el contenedor"
#El recurso "docker_image" es para hacer pull de una imagen
resource "docker_image" "image_frontEnd"{
    #Nombre de la imgagen declarada en el script
    name = "aik-front:1.0"
}

#Declaramos el recurso con la imagen para el backend
resource "docker_image" "image_backEnd"{
    #Nombre de la imagen declarada en el script
    name = "aik-back:1.0"
}