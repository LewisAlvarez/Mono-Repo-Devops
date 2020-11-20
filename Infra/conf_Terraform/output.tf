#Archivo de retorno de las variables de salida
#La salida seran las zonas de disponibilidad 
output "availability_zone" {
    value = [
        var.availability_zones
    ]
}

#Esta es la salida para que tiene la URL de del ELB para ingresar al portal
output "elb_public_dns" {
    value = aws_lb.aik_lb.dns_name
}