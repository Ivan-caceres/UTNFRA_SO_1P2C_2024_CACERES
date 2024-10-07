#!/bin/bash
ruta=~/repogit/UTNFRA_SO_1P2C_2024_CACERES/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt

ip_publica=$(curl -s ifconfig.me)

usuario=$(whoami)

hash_usuario=$(sudo grep "^$usuario:" /etc/shadow | awk -F ':' '{print $2}')

url_repositorio=$(git remote get-url origin)

{
  echo "Mi IP Publica es: $ip_publica"
  echo "Mi usuario es: $usuario"
  echo "El hash de mi usuario es: $hash_usuario"
  echo "La URL de mi repositorio es: $url_repositorio"
} > "$ruta"

echo "Muestro el archivo"
cat $ruta

