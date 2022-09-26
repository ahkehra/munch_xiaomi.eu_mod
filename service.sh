for i in $(seq 1 120)  
    do   
    if [[ `getprop init.svc.bootanim` = "stopped" ]]; then
        a=$( settings list system | grep dc_back_light )
        if [[ $a == *"dc_back_light=1"* ]]; then
        setprop persist.vendor.dc_backlight.enable true
        input keyevent 26
        fi
        exit 0
    fi
    sleep 1
    done
