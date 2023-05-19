#/bin/bash
if [ -d /home/deck/Shortix/ ] || [ -f /home/deck/.config/systemd/user/shortix.service ]; then
  echo "########################"
  echo "#   UPDATING SHORTIX   #"
  echo  "#######################"
  rm -rf /home/deck/Shortix
  systemctl --user disable shortix.service 2> /dev/null
  systemctl --user daemon-reload
else
  echo "##########################"
  echo "#   INSTALLING SHORTIX   #"
  echo "##########################"
fi

mkdir -p /home/deck/Shortix
cp /tmp/shortix/shortix.sh /home/deck/Shortix
chmod +x /home/deck/Shortix/shortix.sh
cp /tmp/shortix/shortix.service /home/deck/.config/systemd/user
systemctl --user daemon-reload
systemctl --user enable shortix.service
systemctl --user start shortix.service
echo  "DONE!"
