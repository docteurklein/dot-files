setxkbmap fr bepo
xset r rate 250 90
eval $(ssh-agent)
ssh-add
exec dbus-launch --exit-with-session i3
