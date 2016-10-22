xset +fp /usr/share/fonts/TTF/

start-pulseaudio-x11 &
pulseaudio-ctl mute
pulseaudio-ctl set 50
xcompmgr -c &
setxkbmap fr
eval $(ssh-agent)
ssh-add
exec i3
