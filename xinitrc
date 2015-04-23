xset +fp /usr/share/fonts/TTF/

start-pulseaudio-x11 &
pulseaudio-ctl mute
pulseaudio-ctl up 100

setxkbmap fr -variant bepo
exec i3
