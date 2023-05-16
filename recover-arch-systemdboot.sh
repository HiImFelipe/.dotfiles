mkdir /mnt/arch
sudo mount /dev/nvme0n1p2 /mnt/arch
sudo mount --bind /dev /mnt/arch/@/dev
sudo mount --bind /proc /mnt/arch/@/proc
sudo mount --bind /sys /mnt/arch/@/sys
modprobe efivarfs
sudo mount /dev/nvme0n1p1 /mnt/arch/@/boot
sudo mount --bind /sys/firmware/efi/efivars /mnt/arch/@/sys/firmware/efi/efivars
sudo chroot /mnt/arch/@