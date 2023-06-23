#! /bin/bash

apt update || true   #Обновляем репозиторий

if [ ! -f /opt/desktoptasks/.versionInfo ]; 
   then touch /opt/desktoptasks/.versionInfo; 
fi

CUR_VERSION=$(cat /opt/desktoptasks/.versionInfo)    #Получаем требуемую версию из файла, который должен положить бэк

REQ_VERSION=$(curl -L --header "PRIVATE-TOKEN: glpat-HSMbFb9oJyN7xuVboCVW" "https://git.finch.fm/api/v4/projects/sberzvuk-box%2Fbox-client/jobs/artifacts/master/raw/.versionInfo?job=build-app")    #Получаем текущую версию

if [ $CUR_VERSION = $REQ_VERSION ];    #Сравниваем текущую и желаемую версии
  then
	  echo "ZvukBox - newest release version - sound for pleasure"
    logger -t DesktopUpdate "The actual version is already installed"    #Если версии одинаковые пишем об этом в лог и выходим
    exit 0;
  else 
    logger -t DesktopUpdate "The actual version is not installed. Let's Install..."
  rm -rf /opt/desktoptasks/box-client.AppImage
  curl --location -o box-client.AppImage --header "PRIVATE-TOKEN: glpat-HSMbFb9oJyN7xuVboCVW" "https://git.finch.fm/api/v4/projects/sberzvuk-box%2Fbox-client/jobs/artifacts/master/raw/out/make/box-client.AppImage?job=build-app"
  sleep 5
  chmod +x box-client.AppImage
  echo $REQ_VERSION > /opt/desktoptasks/.versionInfo   #Записываем версию из текущего репозитория в индексный файл

   CUR_VERSION=$(cat /opt/desktoptasks/.versionInfo)    #Получаем еще раз текщую версию
    if [ $CUR_VERSION = $REQ_VERSION ];    #Сравниваем текущую и желаемую версии
      then
	      echo "ZvukBox services restarted"
        systemctl restart desktop_player.service
        logger -t DesktopUpdate "Player service restarted"
        logger -t DesktopUpdate "Successfully installed" && echo "ZvukBox services running successful" && echo "..."    #Фидбек в бэк
      else
	      echo "Something went wrong"
        logger -t DesktopUpdate "Something went wrong"      #Фидбек в бэк
    fi
fi
