Installation 
============

    qemu-system-x86_64 -m 512 -enable-kvm
    -boot d -cdrom ~/Downloads/archlinux-2017.06.01-x86_64.iso
    -hda mydisk.img
    -virtfs local,path=/home/florian/dot-files,mount_tag=host0,security_model=passthrough,id=host0

Clone the repository:

    git clone git://github.com/docteurklein/dot-files.git ~/dot-files

Create symbolic links:

    for f in $(ls -1 ~/dot-files); do ln -s ~/dot-files/$f ~/.$f; done

Done!

