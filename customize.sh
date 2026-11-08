ui_print "*************************************************"
ui_print " LiveBoot Verbose Boot (CMF Phone 2 Pro Edition) "
ui_print "*************************************************"

ui_print "- Detecting display resolution..."
output="$(wm size 2>/dev/null)"
if [ "$output" ]; then
    width_height="$(echo "$output" | tr -s ' ' ':' | cut -d':' -f3)"
    width="$(echo "$width_height" | cut -d'x' -f1)"
    height="$(echo "$width_height" | cut -d'x' -f2)"
else
    # Fallback calibrated specifically for Nothing CMF Phone 2 Pro (Galaga) (1080x2412)
    width=1080
    height=2412
fi

ui_print "  - Target resolution: ${width}x${height}"

if [ ! -f "$MODPATH/config" ]; then
    ui_print "- Applying default Linux Console verbose profile..."
    cat > "$MODPATH/config" <<EOF
dark
logcatlevels=VDIWEFS
logcatbuffers=MSREC
logcatformat=threadtime
colors
dmesg=0-99
lines=90
wordwrap
suicidedelay=500
fallbackwidth=$width
fallbackheight=$height
EOF
else
    ui_print "- Existing config preserved."
fi

ui_print "- Installing service and post-fs-data hooks..."
cp -f "$MODPATH/loader.sh" "$MODPATH/service.sh"
cp -f "$MODPATH/loader.sh" "$MODPATH/post-fs-data.sh"

ui_print "- Setting permissions..."
set_perm "$MODPATH/loader.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
set_perm "$MODPATH/set_mode.sh" 0 0 0755
set_perm "$MODPATH/libdaemonize.so" 0 0 0755
set_perm "$MODPATH/config" 0 0 0644
set_perm "$MODPATH/liveboot.apk" 0 0 0644

ui_print " "
ui_print "Installation complete!"
ui_print "Reboot to see live Linux kernel dmesg & logcat on boot!"
