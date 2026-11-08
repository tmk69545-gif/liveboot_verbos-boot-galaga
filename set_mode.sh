#!/system/bin/sh
MODDIR="${0%/*}"

case "$1" in
    console|dark|1)
        cp -f "$MODDIR/presets/linux_console.conf" "$MODDIR/config"
        echo "[+] Switched to: Linux Console (Dark background, full color dmesg + logcat)"
        ;;
    hud|transparent|2)
        cp -f "$MODDIR/presets/transparent_hud.conf" "$MODDIR/config"
        echo "[+] Switched to: Transparent HUD (Overlays logs on top of boot animation)"
        ;;
    minimal|3)
        cp -f "$MODDIR/presets/minimal_errors.conf" "$MODDIR/config"
        echo "[+] Switched to: Minimal (Warnings and errors only)"
        ;;
    *)
        echo "======================================"
        echo " LiveBoot Preset Switcher"
        echo "======================================"
        echo "Usage: su -c '$MODDIR/set_mode.sh [mode]'"
        echo ""
        echo "Options:"
        echo "  console / 1  - Pure Linux terminal console (Jet-black, full dmesg + logcat)"
        echo "  hud / 2      - Transparent HUD overlay (Logs over Voltage OS boot animation)"
        echo "  minimal / 3  - Minimalist (Only crashes & warnings, dmesg off)"
        echo "======================================"
        ;;
esac
