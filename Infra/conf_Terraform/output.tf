#Archivo de retorno de las variables de salida
#La salida seran las zonas de disponibilidad 
output "availability_zone" {
    value = [
        "${data.aws_availability_zones.all_zones.names}"
    ]
}