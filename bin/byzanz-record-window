#!/bin/bash
# http://askubuntu.com/questions/107726/how-to-create-animated-gif-images-of-a-screencast

# Delay before starting
DELAY=5

# Sound notification to let one know when recording is about to start (and ends)
beep() {
    echo -ne '\007'
}

# Duration and output file
if [ $# -gt 0 ]; then
    D="--duration=$@"
else
    echo Default recording duration 10s to /tmp/recorded.gif
    D="--duration=10 /tmp/recorded.gif"
fi
XWININFO=$(xwininfo)
read X <<< $(awk -F: '/Absolute upper-left X/{print $2}' <<< "$XWININFO")
read Y <<< $(awk -F: '/Absolute upper-left Y/{print $2}' <<< "$XWININFO")
read W <<< $(awk -F: '/Width/{print $2}' <<< "$XWININFO")
read H <<< $(awk -F: '/Height/{print $2}' <<< "$XWININFO")

echo Delaying $DELAY seconds. After that, byzanz will start
for (( i=$DELAY; i>0; --i )) ; do
    echo $i
    sleep 1
done

beep
byzanz-record --verbose --delay=0 --x=$X --y=$Y --width=$W --height=$H $D
beep
