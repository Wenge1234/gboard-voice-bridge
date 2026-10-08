#!/bin/bash
# Gboard Voice Bridge v0.2 可复现构建（纯线上后端，无本地引擎）
# 依赖：smali / aapt2 / zipalign / apksigner（工具环境自带）、android framework-res
set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/build"
FW=/usr/share/android-framework-res/framework-res.apk
KS="$ROOT/vb.keystore"

rm -rf "$OUT"
mkdir -p "$OUT"

echo "[1/5] smali -> classes.dex"
smali a "$ROOT/smali" -o "$OUT/classes.dex"

echo "[2/5] aapt2 编译资源 + link"
aapt2 compile --dir "$ROOT/res" -o "$OUT/res.zip"
aapt2 link -o "$OUT/base.apk" -I "$FW" \
  --manifest "$ROOT/AndroidManifest.xml" \
  "$OUT/res.zip"

echo "[3/5] 打包 classes.dex（以 aapt2 产物为底）"
cp "$OUT/base.apk" "$OUT/stage.apk"
cd "$OUT"
zip -q -X "$OUT/stage.apk" classes.dex
zipalign -f 4 "$OUT/stage.apk" "$OUT/aligned.apk"

echo "[4/5] 签名（若 keystore 不存在则生成）"
if [ ! -f "$KS" ]; then
  keytool -genkeypair -v -keystore "$KS" -alias vb \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -storepass android -keypass android \
    -dname "CN=VoiceBridge"
fi
apksigner sign --ks "$KS" --ks-pass pass:android \
  --out "$OUT/gboard-voice-bridge-0.2.0.apk" "$OUT/aligned.apk"

echo "[5/5] 校验"
apksigner verify "$OUT/gboard-voice-bridge-0.2.0.apk"
unzip -l "$OUT/gboard-voice-bridge-0.2.0.apk" | head -20
echo "MODULE_BUILD_OK"
ls -la "$OUT/gboard-voice-bridge-0.2.0.apk"
