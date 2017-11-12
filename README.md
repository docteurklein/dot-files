Installation
============

## on a host

    qemu-img create mydisk.img 2G

    qemu-system-x86_64 -enable-kvm \
    -m 1024 \
    -drive format=raw,file=$HOME/Downloads/archlinux.iso \
    -drive format=raw,file=mydisk.img \
    -virtfs local,path=/$HOME,mount_tag=host0,security_model=passthrough,id=host0

# in the VM

    mkdir /dot && mount -t 9p -o trans=virtio host0 /dot
    cd /dot
    ./install -u florian -i /dot/.ssh/id_rsa -b /dev/sdb -p /dev/sdb1

Clone the repository:

    git clone git://github.com/docteurklein/dot-files.git ~/dot-files

Create symbolic links:

    for f in $(ls -1 ~/dot-files); do ln -s ~/dot-files/$f ~/.$f; done

Done!

