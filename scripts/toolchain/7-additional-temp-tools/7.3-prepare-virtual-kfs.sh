mkdir -pv $LFS/{dev,proc,sys,run}

#Creating Initial Device Nodes
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3

#Mounting and Populating /dev
mount -v --bind /dev $LFS/dev

#Mounting Virtual Kernel File Systems
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

#In some host systems, /dev/shm is a symbolic link to /run/shm. The /run tmpfs was mounted above so in this case only
# a directory needs to be created.
if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi