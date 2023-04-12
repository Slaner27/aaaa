#/bin/bash

clear_output() {
    sleep 3; clear
    main;
}

#выводит время запуска скрипта в файл /tmp/launch-script.log, 
#не удаляя ранее записанную информацию.

#Сценарий должен содержать полноценные комментарии, 
#сохранить сценарий /usr/bin/launch-script.sh на машине с именем alt.


get_date() {
    echo "Скрипт был запущен: $(date)" >> /usr/bin/launch-script.sh  #Вызов команды date
}


input_date () {
    #local answer
    #local path = "/etc/launch-script-modified.conf"
    source /etc/launch-script-modified.conf

    if [[ "$elem_lang" = "RU" ]]; then
        echo $(date) > $path_save

    elif [[ "$elem_lang" = "EN" ]]; then
        echo $(date -R) > $path_save

    else
        echo $(date -R) > /tmp/launch-script-modified.log
    fi

}



main() {
    local answer

	echo "[1] Получить время запуска скрипта (Задание 5)"
	echo "[2] Прочитать информацию из конфигурации и запустить скрипт (Задание 6)"
    echo "[3] Выйти"

	echo -n "Ваш ответ [1-4]: "; read answer

    case $answer in
        1)
            get_date
            ;;
            
        2)
            input_date
            ;;

        3) 
            return 0
            ;;

        *)
            echo "Такого пункта нет в меню"
            clear_output
            ;;

    esac
}
