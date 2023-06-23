if [[ $(grep -c 'mopidy' /etc/passwd) -eq 1 ]]; then
  echo "user 'mopidy' already exists"
else
  echo "creating user 'mopidy'"
  useradd -m -s /bin/bash -g audio -G audio,video,sudo mopidy
fi
