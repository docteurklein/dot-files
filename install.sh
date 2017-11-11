#!/usr/bin/env sh

set -exuo pipefail

OPTIND=1
destroy=false

while getopts "b:p:u:i:d" opt; do
    case "$opt" in
        d)  destroy=true
            echo "will destroy partition!" >&2
            ;;
        i)  identity=$OPTARG
            echo "identity: $identity" >&2
            ;;
        b)  block=$OPTARG
            echo "block: $block" >&2
            ;;
        p)  partition=$OPTARG
            echo "partition: $partition" >&2
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

finish() {
    umount /mnt
}

trap finish EXIT

main() {
    loadkeys fr-bepo
    timedatectl set-ntp true

    $destroy && prepare_disk $block $partition
    mount $partition /mnt

    [ ! $destroy ] && packages

    genfstab -U /mnt > /mnt/etc/fstab
    echo 'en_US.UTF-8 UTF-8' > /mnt/etc/locale.gen
    echo 'LANG=en_US.UTF-8' > /mnt/etc/locale.conf
    echo 'KEYMAP=fr-latin1' > /mnt/etc/vconsole.conf

    mkdir -p /mnt/home/$username/.ssh
    cp $identity /mnt/home/$username/.ssh/
    cp $identity.pub /mnt/home/$username/.ssh/

    arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
    arch-chroot /mnt hwclock --systohc
    arch-chroot /mnt locale-gen
    $destroy && arch-chroot /mnt grub-install --target=i386-pc $block
    $destroy && arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
    arch-chroot /mnt passwd

    arch-chroot /mnt id $username || useradd -m -s /usr/bin/zsh $username && passwd $username
    arch-chroot /mnt echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    arch-chroot /mnt echo "${username}-laptop" > /etc/hostname
    arch-chroot /mnt chown -R $username:$username /home/$username/.ssh
    arch-chroot /mnt chmod 0644 /home/$username/.ssh/id_rsa.pub
    arch-chroot /mnt chmod 0400 /home/$username/.ssh/id_rsa

    arch-chroot /mnt sudo -u $username git clone git@github.com:docteurklein/dot-files.git /home/florian/dot-files
    arch-chroot /mnt sudo -u $username cd /home/$username/dot-files && for f in $(ls -1 /home/$username/dot-files); do ln -s ~/dot-files/\$f \~/.\$f; done

    arch-chroot /mnt systemctl enable --now dhcpcd
    arch-chroot /mnt systemctl enable --now ntpd
    arch-chroot /mnt systemctl enable --now wpa_supplicant
    arch-chroot /mnt configure_autologin $username
    arch-chroot /mnt exit
EOL
}

packages() {
    pacstrap /mnt \
        base
    configure_pacman
    pacstrap /mnt \
        base-devel ntp dhcpcd grub \
        wpa_actiond wpa_supplicant \
        xorg-server xorg-xinit xsel \
        pulseaudio \
        docker \
        i3 \
        tmux zsh rxvt-unicode gvim git \
        chromium \
        noto-fonts \
        #yaourt

    #yaourt -S ttf-dejavu-sans-mono-powerline-git
}

configure_pacman() {
    echo '[archlinuxfr]' >> /mnt/etc/pacman.conf
    echo 'SigLevel = Never' >> /mnt/etc/pacman.conf
    echo 'Server = http://repo.archlinux.fr/x86_64' >> /mnt/etc/pacman.conf

    cp /mnt/etc/pacman.conf /etc/pacman.conf
}

configure_autologin() {
    declare username=$1
    dest=/etc/systemd/system/getty@tty1.service.d/override.conf
    mkdir -p $(dirname $dest)
    cat > $dest <<EOL
    [Service]
    ExecStart=
    ExecStart=-/sbin/agetty --autologin $username --noclear %I 38400 linux
EOL
}

prepare_disk() {
    declare block=$1 partition=$2

    fdisk $block <<EOL
    n
    p
    1


    w
EOL

    mkfs.ext4 $partition
}

main
