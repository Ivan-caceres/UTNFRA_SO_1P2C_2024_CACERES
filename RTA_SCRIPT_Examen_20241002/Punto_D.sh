#!/bin/bash
echo 
echo "Creo estrusctura asismetrica: "
mkdir -p ~/Estructura_Asimetrica/{{correo,clientes}/cartas_{2..100},correo/carteros_{1..10}}

echo 
echo "Muestro estructura: "

tree ~/Estructura_Asimetrica/
tree Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

