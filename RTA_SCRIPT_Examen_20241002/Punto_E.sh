#!/bin/bash

ruta=~/repogit/UTNFRA_SO_1P2C_2024_CACERES/RTA_ARCHIVOS_Examen_20241007/Filtro_Basico.txt

# Obtener total de RAM
total_ram=$(grep -i '^MemTotal' /proc/meminfo | awk '{print $2, $3}')

# Obtener el fabricante del chasis
chassis_manufacturer=$(sudo dmidecode -t chassis | grep -i 'Manufacturer')

# Guardar los resultados en el archivo
echo "MemTotal: $total_ram" > "$ruta"
echo "Chassis Information: $chassis_manufacturer" >> "$ruta"

echo "Muestro el archivo: "
cat $ruta


