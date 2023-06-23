!/bin/bash
rm -rf /opt/desktoptasks/box-client.AppImage
sudo curl --location -o box-client.AppImage --header "PRIVATE-TOKEN: glpat-HSMbFb9oJyN7xuVboCVW" "https://git.finch.fm/api/v4/projects/sberzvuk-box%2Fbox-client/jobs/artifacts/master/raw/out/make/box-client.AppImage?job=build-app"
sleep 10
chmod +x box-client.AppImage
/usr/bin/startx ./box-client.AppImage
