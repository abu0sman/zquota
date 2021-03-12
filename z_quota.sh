#!/bin/bash
# Скрипт проверяющий размер каталогов. При привышении размера, каталог становится только для чтения.

message="Квота не привышена";

#Читаем конфигурационный файл
read -r -a dirz <<< $(more /home/mag/prg/zquota/zquota.conf);

# Парсим вывод комманды du, извлекая из вывода только размер каталога в киллобайтах (переменная ${du_out[0]})
#read -r -a du_out <<< $(du -sk /home/mag/quota);

#if [ ${du_out[0]} -gt $quota ]
#then 
#	message="Внимание квота привышена!"
#fi

echo "Debug output";
#echo "Размер каталога /mnt/quota/mag:" ${du_out[0]};
#echo "Квота составляет:" $quota "КБ";
#echo $message;
echo "Каталоги:" ${dirz[0]};