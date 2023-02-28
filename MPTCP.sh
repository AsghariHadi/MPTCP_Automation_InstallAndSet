b=$(grep gnulinux /boot/grub/grub.cfg | awk -F "id_option" '{print $2}' | grep mptcp-ad | awk -F"'"  '{print $2}')
a=$(grep gnulinux /boot/grub/grub.cfg | awk -F "id_option" '{print $2}' | grep advance | awk -F "'" '{print $2}' | head -n 1 )

echo "$a"
echo "$b"

sudo sed --i "s/GRUB_DEFAULT=0/GRUB_DEFAULT=\"$a>$b\"/" /etc/default/grub
echo "------------------------------------"
cat /etc/default/grub
sudo update-grub
