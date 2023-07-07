# Grandfather Clock Cron Job

## Usage

### Dependencies

Your system needs the following dependencies in order to use this script:

- `cron`
- `aplay`: https://man.archlinux.org/man/aplay.1.en
- `ffmpeg` if you wish to make custom audio files

This script is only tested on Raspbian and Ubuntu. This script has not been tested on OSX, MacOS, Windows, Windows Subsystem for Linux, Fedora, Red Hat, or any other operating system.

### Installation

1. Clone this repository somewhere, like `~/software/grandfather-cron/`
2. Determine your user's UID: run `id -u`
3. Edit `clock.bash` to replace the `1000` with your user's PID
4. From `~`, try running your script: `bash ~/software/grandfather-cron/clock.bash` 
5. You should hear noises. If not, check your computer:
	- Are the speakers plugged in and powered on?
	- Were there any error messages?
6. Generate a crontab entry for this script: https://crontab-generator.org/
	- every 15 minutes, all day, every day: `*/15 * * * * ~/grandfather-cron/clock.bash >/dev/null 2>&1`
	- every 15 minutes, from 7 a.m. to 9 p.m., on weekdays: `*/15 7-21 * * 1-5 ~/grandfather-cron/clock.bash >/dev/null 2>&1`

### Customization

You can replace the supplied `.wav` files with your own `.wav` files, but note:

- The files must be `.wav` for `aplay` to play them. Convert non-`.wav` files to `.wav` with `ffmpeg`, like so: `ffmpeg -i random-audio-file.ogg output.wav`
- Different audio files have different volume levels. You will need to normalize the audio volume of your different files. I did this by following the instructions at https://superuser.com/a/323127 under "Option 3: Manually normalizing audio with `ffmpeg`"

You can replace `aplay` with another command-line audio player, but you'll need to look up the command-line arguments yourself.

### Deployment

I put this script on a Raspberry Pi Zero W with a [Pimoroni Pirate Audio 3W stereo amp](https://shop.pimoroni.com/products/pirate-audio-3w-stereo-amp?variant=31189753233491) and a 3W speaker, in a 3d-printed [HIFI Maze Speaker Audio Box](https://www.thingiverse.com/thing:2396264) by [Thingiverse user iiime](https://www.thingiverse.com/iiime), with a [Pi Zero case](https://www.thingiverse.com/thing:1167846) by [Thingiverse user DotNetWorker](https://www.thingiverse.com/DotNetWorker).

## Credits

The following public-domain audio files are used in this project:

- The Taco Bell Bong is used for the hour chime: https://commons.wikimedia.org/wiki/File:Taco_Bell_Bong.ogg
- The Westminster Quarters chimes are copied from the Wikipedia-generated files in the article https://en.wikipedia.org/wiki/Westminster_Quarters and are used [under the terms of Wikipedia's content license](https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use#7._Licensing_of_Content)

## License

![Creative Commons BY-SA License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>. The full text of this license is available in [LICENSE.txt](./LICENSE.txt).
