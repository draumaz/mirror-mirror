## function
- control your phone from desktop à la iphone mirroring
- provide an xdg shortcut
- create specified app launchers, as ```$2``` is processed as ```monkey -p $2 1```

## install
```
clear
curl --silent --create-dirs -o ${HOME}/.local/share/applications/mirror-mirror.desktop https://raw.githubusercontent.com/draumaz/mirror-mirror/refs/heads/main/mirror-mirror.desktop
ls -al ${HOME}/.local/share/applications/mirror-mirror.desktop
curl --silent --create-dirs -o ${HOME}/.local/bin/mirror-mirror https://raw.githubusercontent.com/draumaz/mirror-mirror/refs/heads/main/mirror-mirror.sh
chmod +x ${HOME}/.local/bin/mirror-mirror
ls -al ${HOME}/.local/bin/mirror-mirror
case "${PATH}" in *.local/bin*) echo ":D" ;; *) echo "D:" ;; esac
```

## skip PIN entry
```sed -i 's/mirror-mirror/mirror-mirror YOUR_PIN_HERE/g' ${HOME}/.local/share/applications/mirror-mirror.desktop```
