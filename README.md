```
clear
curl --silent --create-dirs -o ${HOME}/.local/share/applications/mirror-mirror.desktop https://raw.githubusercontent.com/draumaz/mirror-mirror/refs/heads/main/mirror-mirror.desktop
ls -al ${HOME}/.local/share/applications/mirror-mirror.desktop
curl --silent --create-dirs -o ${HOME}/.local/bin/mirror-mirror https://raw.githubusercontent.com/draumaz/mirror-mirror/refs/heads/main/mirror-mirror.sh
chmod +x ${HOME}/.local/bin/mirror-mirror
ls -al ${HOME}/.local/bin/mirror-mirror
case "${PATH}" in *.local/bin*) echo ":D" ;; *) echo "D:" ;; esac
```
