#!/bin/sh
# Check if web.whatsapp.com supports the default browser
# and open it if yes, otherwise show a warning
# (WhatsApp is a piece of shit)

# TODO: migrate to gettext if someone wants other languages here
if echo "$LANG" | grep -Ei "^ru_|^ru$" | grep -Eiq 'utf8|utf-8'
	then
		str1="Браузер по умолчанию не установлен или не поддерживается WhatsApp-ом, а подедрживаемые им браузеры не были найдены! Рекомендуем установить Chromium или Firefox."
	else
		str1="Default browser is not set or is not supported, and no supported browsers have been found! We recommend to install Chromium or Firefox."
fi

zenity_error(){
	zenity --error --width=300 --title='WhatsApp Web Launcher' --text="$*"
}

check_other_browsers(){
	for i in chromium-browser chromium firefox yandex-browser-beta opera vivaldi
	do
		if [ -x "$(command -v "$i")" ]; then
			default_browser="$i"
		fi
	done
	if [ -z "$default_browser" ]; then
		zenity_error "$str1"
		exit 2
	fi
}

default_browser="$(xdg-settings get default-web-browser)"

if [ -z "$default_browser" ]; then
	check_other_browsers
fi

if ! echo "$default_browser" | grep -qiE 'chrome|chromium|firefox|yandex|opera|vivaldi' ; then
	check_other_browsers
fi

xdg-open 'https://web.whatsapp.com/'
