#!/bin/sh

LOCK_STATE=0

PIN="${1}"
APP_PKG="${2}"
APP_NAME="${3}"

EVENT_POWER="26"
EVENT_ENTER="66"

case $(adb shell dumpsys window | grep mDream | tr ' ' '\n' | grep mDreamingLockscreen | tr '=' '\n' | tail -1) in
  true)
    LOCK_STATE=1
    
    case "${PIN}" in "")
      PIN=$(zenity --entry --title="Your device is locked; please enter your PIN." --text="You can hardcode your PIN as \$1 following the binary in the .application file; find the Exec line.") || exit 1 ;;
    esac
    
    case $(adb shell dumpsys power | grep -E "mWakefulness=|Display Power: state=") in *Dozing*)
      adb shell input keyevent "${EVENT_POWER}"
    ;; esac

    adb shell input touchscreen swipe 500 1500 500 500 200 && sleep 0.5
    adb shell input text "${PIN}"
    adb shell input keyevent "${EVENT_ENTER}"
  ;;
esac

case "${APP_PKG}" in 
  "")
    scrcpy --turn-screen-off --window-width=890 --window-height=700
  ;;
  *)
    case "${APP_NAME}" in "") APP_NAME="${APP_PKG}" ;; esac
    scrcpy --new-display=890x700 --start-app="+${APP_PKG}" -x --window-title "${APP_NAME}"
  ;;
esac

case "${LOCK_STATE}" in 1) adb shell input keyevent "${EVENT_POWER}" ;; esac
