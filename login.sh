#  /bin/zsh
clear
number=0
lvls=$(cat -n users 2>/dev/null |awk '{print $1}' )
newusu=$(cat -n users |awk '{print $1}'| tail -n 1)
echo "\n---------------------------------------------\n"
echo "[+] 1) Crear el usuario y conectarse\n"
echo "[+] 2) Insertar usuario y contraseña"
echo "[+] 3) Modificar contraseña"
echo "[+] 4) Conectarte a un nivel"
echo "\n---------------------------------------------\n"


echo "\nElige una de las opciones: (1/2/3/4)"
read option

clear
if [ $option -eq 1 ]
then

	echo "\nEstablezca una contraseña para bandit$newusu:\n"
	read pass
	echo "bandit$newusu:$pass" >> users
	user=$(cat users|grep "bandit$newusu"| cut -d: -f 1)
	cat users | grep $user | cut -d: -f 2 | xclip -sel clip
	ssh -p 2220 $user@bandit.labs.overthewire.org




echo a

elif [ $option -eq 2 ]
then
	echo "\n-----------------------------------------"
	echo "OPCION DE INSERTAR USUARIO Y CONTRASEÑA"
	echo "-----------------------------------------\n"
	echo "\nEstablezca una contraseña para bandit$newusu:\n"
	read pass
		if [ $pass ]
		then
		echo "$newusu:$pass" >> users
		echo "\nUsuario y contraseña creados correctamente"
		else
		pass=vacio
		echo "$newusu:$pass" >> users
		echo "\nUsuario y contraseña creados correctamente"
		fi
elif [ $option -eq 3 ]
then
cat users | cut -d: -f 1
echo "\nDe que usuario quieres cambiar la contraseña: ? (bandit1/bandit2/...)"
	read option
		if [ $(cat users | grep -o $option) ]
		then
		echo "\nEstablezca una nueva contraseña:"
		read pass
		sed -i 's/'$(cat users | grep $option | cut -d: -f 2)'/'$pass'/g' "users"
		echo "\n\n[+]Contraseña restablecida correctamente"
		fi
elif [ $option -eq 4 ]
then
	echo "\nEstos son los niveles que hay disponibles:\n"
	for i in $lvls
	do
	echo "[+]Nivel --> $(($i-1))"
	done

	echo "\nSeleciona un nivel para acceder a él (0/1/2/...)"

	read num

	if [ $(echo $lvls |grep -o $(($num+1))) ]
	then
	user=$(cat users|grep -w "bandit$num"| cut -d: -f 1)
	cat users | grep $user | cut -d: -f 2 | xclip -sel clip
	ssh -p 2220 $user@bandit.labs.overthewire.org
	else
	echo "\nNo has desbloquedo ese nivel"
	fi

else
echo error 
fi












