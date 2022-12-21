BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
# CHARGING=$(pmset -g batt | grep "AC Power")
if [[ $CHARGING != "" ]]; then
  sketchybar -m --set battery           \
    icon=""                           \
    label="${BATT_PERCENT}"
  exit 0
fi
case ${BATT_PERCENT} in
   100) ICON=""; COLOR="0xff9ac868";;
    9[0-9]) ICON=""; COLOR="0xff9ac868" ;;
    8[0-9]) ICON=""; COLOR="0xff9ac868" ;;
    7[0-9]) ICON=""; COLOR="0xfffbc62d" ;;
    6[0-9]) ICON=""; COLOR="0xfffbc62d" ;;
    5[0-9]) ICON=""; COLOR="0xfffbc62d" ;;
    4[0-9]) ICON=""; COLOR="0xfffbc62d" ;;
    3[0-9]) ICON=""; COLOR="0xfffbc62d" ;;
    2[0-9]) ICON=""; COLOR="0xfffbc62d" ;;
    1[0-9]) ICON=""; COLOR="0xfff65e51" ;;
    *) ICON=""; COLOR="0xfff65e51"
esac
sketchybar -m --set battery             \
  icon="$ICON"                          \
  label="${BATT_PERCENT}" \
  label.color="$COLOR"                    \
