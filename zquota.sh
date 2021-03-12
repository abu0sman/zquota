#!/bin/bash
# Скрипт проверяющий размер каталогов. При привышении размера, каталог становится только для чтения.

message="Квота не привышена";


#Читаем конфигурационный файл
FILE='/home/mag/prj/zquota/zquota.conf';



# Парсим вывод комманды du, извлекая из вывода только размер каталога в киллобайтах (переменная ${du_out[0]})
#read -r -a du_out <<< $(du -sk /home/mag/quota);

echo "Debug output";
#echo "Размер каталога /mnt/quota/mag:" ${du_out[0]};
#echo "Квота составляет:" $quota "КБ";
#echo $message;
#echo "Каталоги:" ${dirz[0]};
while read LINE
	do 
	# Получили путь к каталогу ${quotez[0]} и допустимую квоту ${quotez[1]}	
	read -r -a quotez <<< $LINE
	
	#Теперь получаем реальный размер каталога ${du_out[0]}
	read -r -a du_out <<< $(du -sk ${quotez[0]});


	if [ ${quotez[1]} -lt ${du_out[0]} ]
	then 
		message="Внимание квота привышена!"
	fi
	echo Каталог:${quotez[0]}, Квота:${quotez[1]}, Тек.размер:${du_out[0]}, $message 
done < $FILE