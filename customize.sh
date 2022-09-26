SKIPUNZIP=1
DEVICE=$(getprop ro.product.mod_device 2>/dev/null)
ANDROID=$(getprop ro.system.build.version.release 2>/dev/null)
ui_print " ╭━━┳╮╭╮╱╱╱╱╭━━╮ "
ui_print " ┃╭╮┃┣╋╋┳┳━╮┃━━╋┳┳━┳━┳┳╮ "
ui_print " ┃┣┫┃━┫┃╭┫╋╰╋━━┃┃┃╋┃┻┫╭╯ "
ui_print " ╰╯╰┻┻┻┻╯╰━━┻━━┻━┫╭┻━┻╯ "
ui_print " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯ "
ui_print "*******************************"
ui_print "- $DEVICE $ANDROID"
set -x
if [ "$DEVICE" == "munch_xiaomieu_global" ]; then
    ui_print "- Extracting module files"
    unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
    unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
    unzip -o "$ZIPFILE" system.tar.xz -d $MODPATH >&2
    tar -xf $MODPATH/system.tar.xz -C $MODPATH 2>/dev/null
    rm -rf $MODPATH/system.tar.xz 2>/dev/null
else
    abort
fi
