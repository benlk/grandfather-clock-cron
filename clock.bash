# /usr/bin/env bash
#
# This is a single-point-of-entry script to play grandfather-clock tunes.
#
# To use this script, add it as a cronjob that runs every 15 minutes.
# Example crontab entry:
#     */15 * * * * ~/grandfather-cron/clock.bash >/dev/null 2>&1
#
# This work is licensed under the
# Creative Commons Attribution-ShareAlike 4.0 International License.
# To view a copy of this license, visit
# http://creativecommons.org/licenses/by-sa/4.0/
# or send a letter to:
#
# Creative Commons
# PO Box 1866
# Mountain View
# CA 94042
# USA
#

# This is necessary for the cron job to create audio output.
# https://askubuntu.com/a/1045344
#
# Set your user UID here, replacing the number:
export XDG_RUNTIME_DIR="/run/user/1000"

# The script's audio files are played relative to the script's location.
DIR=$(dirname $0)

# What time is it?
HOUR=$(date +%H)
MINUTE=$(date +%M)

# This is how we do math, I guess?
declare -i QUARTER="$MINUTE / 15"

# Toll the hour.
bong() {
	((BONGS=$HOUR-1))
	# This is not a 24-hour clock.
	if [[ $BONGS -ge 13 ]]
	then
		((BONGS=BONGS-12))
	fi

	while [ $BONGS -ge 0 ]
	do
		echo 'bong'
		aplay -Dhw:0,0 $DIR/bong.wav
		((BONGS=BONGS-1))
	done

}

echo "The current minute is $MINUTE and the quarter is $QUARTER"

# Determine which quarter it is, and play the appropriate noises.
case $QUARTER in
	0)
		aplay -Dhw:0,0 $DIR/00.wav
		bong
		;;
	1)
		aplay -Dhw:0,0 $DIR/15.wav
		;;
	2)
		aplay -Dhw:0,0 $DIR/30.wav
		;;
	3)
		aplay -Dhw:0,0 $DIR/45.wav
		;;

esac
