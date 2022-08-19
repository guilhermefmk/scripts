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
            ip="ip_aqui"
        ;;
    	TV2)
            ip="ip_aqui"
        ;;
        TV3)
    		ip="ip_aqui"
    	;;
        TV4)
            ip="ip_aqui"
        ;;
        TV5)
            ip="ip_aqui"
        ;;
        TV6)
            ip="ip_aqui"
        ;;
        TV7)
            ip="ip_aqui"
        ;;
        TV8)
            ip="ip_aqui"
        ;;
        TV9)
            ip="ip_aqui"
        ;;
        TV10)
            ip="ip_aqui"
        ;;
        TV11)
            ip="ip_aqui"
        ;;
    esac
    sshpass -p "senha-aqui" ssh -o ServerAliveInterval=3 -o ServerAliveCountMax=2 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip "/usr/bin/sed -i '/SOFTWARE_CHROMIUM_AUTOSTART_URL=/d' /boot/dietpi.txt && sed -i '/SOFTWARE_CHROMIUM_RES_Y=/a SOFTWARE_CHROMIUM_AUTOSTART_URL='$url'' /boot/dietpi.txt && /usr/sbin/reboot"
done

