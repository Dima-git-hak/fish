# Bash Скрипт для скрыть фишинг URL создан мной

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Недействительный URL. Пожалуйста, используйте http или https.\e[0m"
            exit 1
        fi
    fi
}
echo -e "\e[40;38;5;82m Пожалуйста, посетите телеграм \e[30;48;5;82m @LegionXlink \e[0m"
echo -e "\e[30;48;5;82m    Автор \e[40;38;5;82m   Дмитрий \e[0m \n\n"
echo -e "\e[1;31;42m ### Фишинг URL-адрес  ###\e[0m \n"
echo -n "Вставьте фишинг URL здесь (с http или https): "
read phish
url_checker $phish
sleep 1
echo "Обработка и Модифинг Фишинг URL"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Маскировочный домен ###\e[0m"
echo 'Домен, чтобы замаскировать фишинг URL (с http или https), к примеру: https://google.com, http
://anything.org) :'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nType social engineering words:(like free-money, best-pubg-tricks)'
echo -e "\e[31mDon't use space just use '-' between social engineering words\e[0m"
echo -en "\e[32m=>\e[0m "
read words
echo -e "\nGenerating fish ссылка...\n"
final=$mask-$words@$shorter
echo -e "Here is the fish URL:\e[32m ${final} \e[0m\n"
