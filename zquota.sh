#!/bin/bash
# Скрипт проверяет размер каталогов. При привышении квоты, владелец теряет права на запись.
# в конфигурационном файле zquota.conf можно прописать каталоги и квоты (в киллобайтах).
# для вывода отладочной информации, требуется раскомментировать строки 6, 22 и 26  

#debug_message="Квота не привышена";

#Читаем конфигурационный файл
FILE=$(pwd)'/zquota.conf';

while read LINE
	do 
	# Получили путь к каталогу ${quotez[0]} и допустимую квоту ${quotez[1]}	
	read -r -a quotez <<< $LINE
	
	#Теперь получаем реальный размер каталога ${du_out[0]}
	read -r -a du_out <<< $(du -sk ${quotez[0]});

	# Проверяем превышение квоты
	if [ ${quotez[1]} -lt ${du_out[0]} ]
	then 
		#debug_message="Внимание квота привышена!";
		$(chmod 555 ${quotez[0]})
	fi
	
	#echo Debug{ Каталог:${quotez[0]}, Квота:${quotez[1]} КБ, Тек.размер:${du_out[0]} КБ, $debug_message }

done < $FILE