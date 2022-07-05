tv=$(zenity  --list --height=400  --text "Selecione as TVs a terem a URL modificada" \
--checklist \
    --column "Marcar" \
    --column "Sistemas" \
   FALSE TV1 FALSE TV2 FALSE TV3 FALSE TV4 FALSE TV5 FALSE TV6 FALSE TV7 FALSE TV8 FALSE TV9 FALSE TV10 FALSE TV11);

cont=$(echo $tv | grep -o "|" | wc -c)
cont2=$(($cont/2))
url=$(zenity --entry --title="URL" --text="Favor informar a nova URL")
for ((c=1; c<=$cont2+1; c++))
do
    temp=$(echo $tv | cut -d"|" -f$c)
    case $temp in
    	TV1)
            ip=172.16.114.54
        ;;
    	TV2)
            ip=172.16.114.22
        ;;
        TV3)
    		ip=172.16.114.23
    	;;
        TV4)
            ip=172.16.114.11
        ;;
        TV5)
            ip=172.16.114.14
        ;;
        TV6)
            ip=172.16.114.16
        ;;
        TV7)
            ip=172.16.114.19
        ;;
        TV8)
            ip=172.16.114.117
        ;;
        TV9)
            ip=172.16.114.12
        ;;
        TV10)
            ip=172.16.114.13
        ;;
        TV11)
            ip=172.16.114.24
        ;;
    esac
    sshpass -p dietpi ssh -o ServerAliveInterval=3 -o ServerAliveCountMax=2 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip "/usr/bin/sed -i '/SOFTWARE_CHROMIUM_AUTOSTART_URL=/d' /boot/dietpi.txt && sed -i '/SOFTWARE_CHROMIUM_RES_Y=/a SOFTWARE_CHROMIUM_AUTOSTART_URL='$url'' /boot/dietpi.txt && /usr/sbin/reboot"
done

