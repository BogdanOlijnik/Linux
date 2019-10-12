#! /bin/bash

main(){
clear
exit=false
ShowMenu;
while [[ $exit == false ]]
do
read a
case $a in
 1) Showdisk; ;;
 2) ShowDiskSpace; ;;
 3) AddPort; ;;   
 0) exit==false; ;;
 *) echo "Wrong number!"; ;;
esac
done

echo -e "Do you want to exit?\ny/n"
read choice
if [[ $choice == "y" ]]
then
 exit=false
clear
echo "Bye!"
sleep 2
fi
}
 
Showdisk(){
ls -l /dev/sd*
}
ShowDiskSpace(){
df -h
}
AddPort(){
echo "Enter nameof disk to portishion"
read disk
fdisk /dev/$disk
}
EditFS(){
echo "Enter name disk to file system"
read disk2
mkfs.etx4 /dev/$disk2
}
EditFsTab(){
echo "Enter name disk to add UID for FStab"
read disk3
blkid | grep $disk3 >>/etc/fstab
vim /etc/fstab
}





ShowMenu(){
echo "
	***************************
	*--------MAIN MENU:-------*
	***************************
	*  1. Show all disks      *
	*  2. Show disk spase     *
	*  3. Add new portishion  *
	*  4. Format disk         *
	*  5. Edit fs tab         *
	*  6. Restart             *
	*  0. EXIT                *
	***************************"
}

main;
