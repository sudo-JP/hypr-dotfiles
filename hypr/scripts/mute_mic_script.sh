CURRENT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d" ")

MUTE_STATUS=$(pactl list sources | grep -A 10 $CURRENT_SOURCE | grep "Mute")

IS_MUTE=$(echo "$MUTE_STATUS" | awk '{print $NF}')

STATUS=1
if [ $IS_MUTE != "no" ]; then 
  STATUS=0 
fi 

TEMP=$(echo $STATUS| sudo tee /sys/class/leds/platform\:\:micmute/brightness)

pactl -- set-source-mute 0 toggle 
