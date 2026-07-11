#!/bin/sh

LOCK_STATE=0

PIN="${1}"
APP_PKG="${2}"

EVENT_POWER="26"
EVENT_ENTER="66"

case "${PIN}" in "")
  PIN=$(zenity --entry --title="Your device is locked; please enter your PIN." --text="You can hardcode your PIN as \$1 following the binary in the .application file; find the Exec line.") ;;
esac

case $(adb shell dumpsys window | grep mDream | tr ' ' '\n' | grep mDreamingLockscreen | tr '=' '\n' | tail -1) in
  true)
    LOCK_STATE=1
    printf "Unlocking device..."

    case $(adb shell dumpsys power | grep -E "mWakefulness=|Display Power: state=") in *Dozing*)
      adb shell input keyevent "${EVENT_POWER}"
    ;; esac

    adb shell input touchscreen swipe 500 1500 500 500 200 && sleep 0.5
    adb shell input text "${PIN}"
    adb shell input keyevent "${EVENT_ENTER}"
    echo "done."
  ;;
esac

case "${APP_PKG}" in "") ;; *) adb shell monkey -p "${APP_PKG}" 1 ;; esac
scrcpy \
  --turn-screen-off \
  --window-height=750

case "${LOCK_STATE}" in 1)
  adb shell input keyevent "${EVENT_POWER}"
;; esac
