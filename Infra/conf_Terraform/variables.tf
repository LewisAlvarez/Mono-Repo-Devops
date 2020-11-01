#Este archivo contiene las variables de entrada a la configuracón de main.tf de terraform
#Puertos de las aplicaciones
#Puerto FrontEnd
variable "port_aik_front"{
    default = 3030
    description = "Puerto de comunicacion con el Front de la aplicacion"
}
#Puerto BackEnd
variable "port_aik_back"{
    default = 3000
    description = "Puerto de comunicacion con el Back de la aplicacion"
}

#Variables usadas para la configuración de las instancias
#AMI
variable "aik_ami_id" {
    default = "ami-0357d42faf6fa582f"
    description = "ID de la imagen ami"
}
#Instance Type
variable "aik_instance_type"{
    default = "t2.micro"
    description = "Tipo de instancia"
}
#Maximo numero de instancias en autoscaling
variable "autoscaling_max"{
    default = "2"
    description = "Numero maximo de instancias en autoscaling"
}
#Minimo de numero de instancias en autoscaling
variable "autoscaling_min"{
    default = "1"
    description = "Numero minimo de instancias en autoscaling"
}
variable "aik_key_name" {
  description = "Key pair name"
  default     = "estudianteAutomatizacion20202_3"
}
