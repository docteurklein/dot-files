#!/usr/bin/env sh

set -exuo pipefail

OPTIND=1

while getopts "u:" opt; do
    case "$opt" in
        b)  block=$OPTARG
            echo "block: $block" >&2
            ;;
        u)  username=$OPTARG
            echo "username: $username" >&2
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

hwclock --systohc

echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'KEYMAP=fr-latin1' > /etc/vconsole.conf

grub-install --target=i386-pc $block
grub-mkconfig -o /boot/grub/grub.cfg

passwd

useradd -m -G docker wheel -s /usr/bin/zsh $username
echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "${username}-laptop" > /etc/hostname
passwd $username

git clone https

systemctl enable --now dhcpcd
systemctl enable --now ntpd
systemctl enable --now wpa_supplicant
