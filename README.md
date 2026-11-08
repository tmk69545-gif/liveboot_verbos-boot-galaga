# LiveBoot Verbose Boot - Nothing Phone (2a) Galaga Edition

[![GitHub Release](https://img.shields.io/github/v/release/tmk69545-gif/liveboot-voltage-galaga?color=brightgreen&label=Release)](https://github.com/tmk69545-gif/liveboot-voltage-galaga/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Root Support](https://img.shields.io/badge/Root-KernelSU%20%7C%20KernelSU--Next%20%7C%20APatch%20%7C%20Magisk-orange)](https://github.com/tmk69545-gif/liveboot-voltage-galaga)
[![Device: Nothing Phone (2a)](https://img.shields.io/badge/Device-Nothing%20Phone%20(2a)%20(Galaga)-black)](https://github.com/tmk69545-gif/liveboot-voltage-galaga)

A customized, flashable root module that brings a real-time, Unix-style **verbose boot mode** to the **Nothing Phone (2a) / Galaga** running **Voltage OS 6.2** (Android 16/15).

It streams live kernel ring buffer logs (`dmesg`) and Android system logs (`logcat`) directly to the screen from early system boot.

---

## ⚡ Features

- **Live On-Screen Log Stream**: View the real Linux kernel initialization (`dmesg`) and Android boot process (`logcat`) live as it happens.
- **Color-Coded Syntax**: Highlights warnings, errors, fatals, and component tags for an authentic Linux terminal look.
- **Calibrated for Nothing Galaga**:
  - Native display resolution fallback calibrated to **1080 × 2412** AMOLED.
  - 90-line display density with word-wrap.
  - Anti-flicker suicide delay (`500ms`) ensuring smooth transitions to your launcher.
- **Multi-Root Solution Support**:
  - Fully compatible with **KernelSU**, **KernelSU Next**, **APatch**, and **Magisk**.
- **On-the-fly Preset Switcher**:
  - Easily toggle between a pure black Unix terminal, a transparent cyberpunk HUD, or a quiet error-only view using a single command.

---

## 📥 Installation

1. Download the latest `LiveBoot-Verbose-Galaga-v6.0.1.zip` from the [Releases](https://github.com/tmk69545-gif/liveboot-voltage-galaga/releases) section.
2. Open your root manager app (**KernelSU**, **KernelSU Next**, or **Magisk**).
3. Navigate to **Modules** → **Install from storage**.
4. Select the downloaded ZIP package.
5. Once installation finishes, tap **Reboot**.

---

## 🎨 Built-in Presets & Customization

The module includes 3 pre-tuned profiles:

| Mode | Appearance | Logs Included |
| :--- | :--- | :--- |
| **Linux Console** *(Default)* | Jet-black terminal screen | Full color `dmesg` (0-99) + `logcat` (`threadtime`) |
| **Transparent HUD** | Transparent overlay | Scrolling logs displayed directly over the ROM boot animation |
| **Minimal Mode** | Jet-black terminal screen | Warnings and crash errors only (`WEFS`) |

### Switching Presets via Terminal / Termux
Open Termux or an ADB root shell on your device and run:

```bash
# Switch to Linux Console (Default):
su -c "/data/adb/modules/livebootmagisk/set_mode.sh console"

# Switch to Transparent HUD:
su -c "/data/adb/modules/livebootmagisk/set_mode.sh hud"

# Switch to Minimal Mode:
su -c "/data/adb/modules/livebootmagisk/set_mode.sh minimal"
```

Or manually customize `/data/adb/modules/livebootmagisk/config` with any root text editor.

---

## 🛠️ Building From Source

To generate the flashable ZIP locally:

```bash
git clone https://github.com/tmk69545-gif/liveboot-voltage-galaga.git
cd liveboot-voltage-galaga
chmod +x build.sh
./build.sh dist/
```

The output zip will be saved in `dist/LiveBoot-Verbose-Galaga-v6.0.1.zip`.

---

## 📜 Credits & License

- Original LiveBoot by [Chainfire (Jorrit Jongma)](https://github.com/Chainfire)
- Updated Android 16/15 compatibility patches by [AntiOblivionis](https://github.com/AntiOblivionis/liveboot)
- Module packaging based on [symbuzzer/livebootmodule](https://github.com/symbuzzer/livebootmodule)
- Tuned for Nothing Galaga & Voltage OS by [ezzydev(Unknown)](https://github.com/tmk69545-gif)

Licensed under the [GNU General Public License v3.0 (GPLv3)](LICENSE).
