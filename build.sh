#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_NAME="LiveBoot-Verbose-CMF-Phone-2-Pro-v6.0.1.zip"
ALIAS_NAME="LiveBoot-Verbose-Galaga-v6.0.1.zip"
OUTPUT_DIR="${1:-$REPO_DIR/dist}"
if [[ "$OUTPUT_DIR" != /* ]]; then
  OUTPUT_DIR="$REPO_DIR/$OUTPUT_DIR"
fi

mkdir -p "$OUTPUT_DIR"
TARGET_ZIP="$OUTPUT_DIR/$OUTPUT_NAME"
ALIAS_ZIP="$OUTPUT_DIR/$ALIAS_NAME"

echo "[*] Packaging module to: $TARGET_ZIP"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

cp "$REPO_DIR/config" "$TMP_DIR/"
cp "$REPO_DIR/customize.sh" "$TMP_DIR/"
cp "$REPO_DIR/libdaemonize.so" "$TMP_DIR/"
cp "$REPO_DIR/liveboot.apk" "$TMP_DIR/"
cp "$REPO_DIR/loader.sh" "$TMP_DIR/"
cp "$REPO_DIR/module.prop" "$TMP_DIR/"
cp "$REPO_DIR/README.md" "$TMP_DIR/"
cp "$REPO_DIR/set_mode.sh" "$TMP_DIR/"
cp -r "$REPO_DIR/META-INF" "$TMP_DIR/"
cp -r "$REPO_DIR/presets" "$TMP_DIR/"

chmod 755 "$TMP_DIR/loader.sh" "$TMP_DIR/customize.sh" "$TMP_DIR/set_mode.sh" "$TMP_DIR/libdaemonize.so" "$TMP_DIR/META-INF/com/google/android/update-binary"
chmod 644 "$TMP_DIR/config" "$TMP_DIR/module.prop" "$TMP_DIR/liveboot.apk" "$TMP_DIR/README.md" "$TMP_DIR/presets/"* "$TMP_DIR/META-INF/com/google/android/updater-script"

cd "$TMP_DIR"
zip -r -q "$TARGET_ZIP" .
cp -f "$TARGET_ZIP" "$ALIAS_ZIP"

echo "[+] Built successfully:"
ls -lh "$TARGET_ZIP" "$ALIAS_ZIP"
