#Configuración para el proveedor donde se desplegará la infraestructura
#Nomenclatura --> resource <PROVIDER> <TYPE> <NAME>
provider "aws"{
    region = "us-east-1"
    version = "2.24"
    #Credenciales de la cuenta
    access_key = var.my_access_key
	secret_key = var.my_secret_key
}

#Basados en el diagrama de la solución los recursos a crear son: 2 intancias EC2, 2 zonas de disponibilidad, 1 balanceador de carga, 1 auto-scaling-group y 2 RDS.

#Se crea un security group para permitir el acceso al pueto de la aplicacion


#Crear una instancia EC2 para el back
resource "aws_instance" "aik_back" {
	ami = "ami-0357d42faf6fa582f"
	instance_type = "t2.micro"
	
	tags = {
		Name = "EC2 BackEnd AIK"
	}
}

#Crear una instancia EC2 para el front
resource "aws_instance" "aik_front" {
	ami = "ami-0357d42faf6fa582f"
	instance_type = "t2.micro"
	
	tags = {
		Name = "EC2 FrontEnd AIK"
	}
}

resource "aws_launch_configuration" "aik-configuration"{
    name = "placeholder"
    image_id = var.aik_ami_id
    instance_type = var.aik_instance_type
    security_group = [aws_security_group.aik-sg-portal.id]
    key_name = var.aik_key_name
}

resource "aws_autoscaling_group" "aik_autoscaling"{
    launch_configuration = aws_launch_configurations.aik-lcfg.name
    min_size = 2
    max_size = 2
}