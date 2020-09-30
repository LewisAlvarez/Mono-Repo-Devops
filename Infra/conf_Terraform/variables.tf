#Este archivo contiene las variables de entrada a la configuracón de main.tf de terraform
#Se expresan las vaiabres para los puertos que usan el Front y el Back
variable "port_frontend"{
    default = 3030
    type ="string"
    description = "Esta variable contendra el valor del puerto para comunicarse con el front-end"
}

variable "port_backend"{
    default = 3000
    type ="string"
    description = "Esta variable contendra el valor del puerto para comunicarse con el back-end"
}