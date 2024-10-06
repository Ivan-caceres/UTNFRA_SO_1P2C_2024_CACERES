#!/bin/bash


echo "Particiono el disco: /dev/sdc."
echo 

sudo fdisk /dev/sdc  << EOF
n
e
4


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
w
EOF
echo
echo "Particiones creadas."
sudo fdisk -l /dev/sdc
echo 
echo "Formateo las particiones: "

for i in {4..13};
do	
	sudo mkfs.ext4 /dev/sdc$i
done
echo
echo "Monto las particiones: "
for i in {4..13};
do
    num_particiones=$i
    for j in {1..3};
    do
        num_alu=$j
        for x in {1..3};
        do
        /dev/sdb$num_particion /Examenes-UTN/alumno_$num_alu/parcial$x ext4 defaults 0 0 | sudo tee -a /etc/fstab

        sudo mount /dev/sdb$num_particion /Examenes-UTN/alumno_$num_alu/parcial$x
        done
    done
done
echo 
echo "Valido montaje: "
df -h | grep /Examenes-UTN

