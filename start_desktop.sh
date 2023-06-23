#!/bin/bash
sudo wget --no-check-certificate -c -t 2 --content-disposition  -O /opt/desktoptasks/box-client.AppImage --header="PRIVATE-TOKEN: glpat-HSMbFb9oJyN7xuVboCVW" "https://git.finch.fm/api/v4/projects/sberzvuk-box%2Fbox-client/jobs/artifacts/master/raw/out/make/box-client.AppImage?job=build-app" 
sleep 20
echo "Finished download"
sudo chown user03:user03 /opt/desktoptasks/box-client.AppImage
sudo chmod +x /opt/desktoptasks/box-client.AppImage
/usr/bin/startx /opt/desktoptasks/box-client.AppImage --no-sandbox


