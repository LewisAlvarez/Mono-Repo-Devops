#Configuración para el proveedor donde se desplegará la infraestructura
#Nomenclatura --> resource <PROVIDER> <TYPE> <NAME>
provider "aws"{
    region = "us-east-1"
}

#Basados en el diagrama de la solución los recursos a crear son: 2 intancias EC2, 2 zonas de disponibilidad, 1 balanceador de carga, 1 auto-scaling-group y 2 RDS.

#Se crea un security group para permitir el acceso al pueto de la aplicacion
resource "aws_security_group" "aik_security_group" {
    name = "aik-security-group"
    description = "Grupo de seguridad para el aplicativo aik"

    #Acceso http desde cualquier direccion
    ingress {
        from_port = 80
        to_port = var.port_aik_front
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }

    #Salida de internet
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }

}

#Obtenemos las zonas de disponibilidad para la region seleccionada
data "aws_availability_zones" "all_zones" {}

#Creacion de un balanceador de carga
resource "aws_elb" "aik_elb" {
    name = "aik-elb"
    #availability_zones = []"${data.aws_availability_zones.all_zones.names}"]
    security_groups = ["${aws_security_group.aik_security_group.id}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "HTTP:80/"
        interval = 30
    }
}

#El configuration Launcher es el template que se usa para lanzar instancias de EC2
#Las variables se encuentran en el archivo variables.tf
resource "aws_launch_configuration" "aik_configuration"{
    name = "placeholder-aik-lc"
    image_id = var.aik_ami_id
    instance_type = var.aik_instance_type
    security_group = [aws_security_group.aik_security_group.id]
    key_name = var.aik_key_name
}
#Creacion del autoscaling group
resource "aws_autoscaling_group" "aik_autoscaling"{
    name = "aik-autoscaling"
    availability_zones = ["${data.aws_availability_zones.all_zones.names}"]
    force_delete = true
    min_size = var.autoscaling_max
    max_size = var.autoscaling_min
    #Lo que debe realizar cada vez que escale
    launch_configuration = aws_launch_configuration.aik_configuration.name
    #Se ubica la nueva instancia dentro del balanceador de carga
    load_balancers = ["${aws_elb.aik_elb.name}"]

    tag {
        key = "Name"
        value = "aik-autoscaling"
    }
}

#Crear una instancia EC2 para el back
resource "aws_instance" "aik_back" {
	ami = var.aik_ami_id
	instance_type = "t2.micro"
	
	tags = {
		Name = "EC2 BackEnd AIK"
	}
}

#Crear una instancia EC2 para el front
resource "aws_instance" "aik_front" {
	ami = var.aik_ami_id
	instance_type = var.aik_instance_type
    
	tags = {
		Name = "EC2 FrontEnd AIK"
	}
}