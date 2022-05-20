#!/bin/bash

LOC=/storage/.config/emulationstation/locale/ko/LC_MESSAGES

cp ./emulationstation2.po $LOC/emulationstation2.po
msgfmt $LOC/emulationstation2.po -o $LOC/emulationstation2.mo

sudo touch "/tmp/es-restart"
kill $(pgrep -l -n emulationstatio | awk '!/grep/ {printf "%s ",$1}')
sudo rm -f "/tmp/es-restart"