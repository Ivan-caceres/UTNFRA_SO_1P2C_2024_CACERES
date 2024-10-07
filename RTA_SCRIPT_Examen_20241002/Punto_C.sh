#!/bin/bash
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

hash_user=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

for i in {1..3};
do
	sudo useradd -m -s /bin/bash -c "Creo user p1c2_2024_A$i" -G p1c2_2024_gAlumno p1c2_2024_A$i

	sudo usermod --password "$hash_user" p1c2_2024_A$i 
done
sudo useradd -m -s /bin/bash -c "Creo user p1c2_2024_P1" -G p1c2_2024_gProfesores p1c2_2024_P1
sudo usermod --password "$hash_user" p1c2_2024_P1

for i in {1..3}:
do
	sudo chown p1c2_2024_A$i:p1c2_2024_gAlumno ~/Examenes-UTN/alumno_$i
done 

sudo chown p1c2_2024_P1:p1c2_2024_gProfesores ~/Examenes-UTN/profesores

sudo chmod 730 ~/Examenes-UTN/alumno_1 

sudo chmod 760 ~/Examenes-UTN/alumno_2

sudo chmod 700 ~/Examenes-UTN/alumno_3

sudo chmod 775 ~/Examenes-UTN/profesores

for j in {1..3};
do
	sudo -u "p1c2_2024_A$j" bash -c "whoami > ~/Examenes-UTN/alumno_$j/validar.txt"

done
