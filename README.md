# Gboard Voice Bridge

把 Gboard（Google 拼音输入法 `com.google.android.inputmethod.latin`）的语音输入替换为可配置第三方语音识别（ASR）引擎的 LSPosed / Xposed 模块。

## 功能

- 接管 Gboard 语音输入，将识别请求改发到自选线上 ASR 引擎；
- 支持四引擎：豆包（火山引擎，默认，WebSocket 流式）、通义千问、讯飞语音听写、OpenAI 兼容接口；
- 设置页可配置 provider / key / secret / appid / url / model / lang；
- 流式上屏，识别结果幂等写入输入框。

## 状态

- **目前仅「豆包」引擎真实跑通验证过**，其余（千问 / 讯飞 / OpenAI 兼容）已实现但尚未实测；
- 基于 Gboard 18.4.1.985164140 逆向定位；官方升级导致混淆方法名变化可能失效。

## 支持

- 目标应用：Gboard `com.google.android.inputmethod.latin`
- Android 8.0（API 26）及以上
- LSPosed（Zygisk）

## 安装

1. 安装 LSPosed（Zygisk）并启用本模块；
2. 在 LSPosed 中勾选作用域：`com.google.android.inputmethod.latin`；
3. 打开「Gboard 语音引擎」设置页，选择引擎并填写对应 key（默认豆包已内置 key，可直接体验）；
4. 重启 Gboard，在任意输入框点麦克风说话。

## 构建

依赖 smali、aapt2、zipalign、apksigner、JDK（keytool）与 android framework-res：

```bash
./build.sh
```

产出 `build/gboard-voice-bridge-0.2.0.apk`。签名使用项目根目录下的 `vb.keystore`（首次构建自动生成，请妥善保管）。

## 原理

Hook 点位于 Gboard 语音输入管线（SODA 引擎边界）：

- 音频侧：捕获 PCM 音频流；
- 引擎侧：拦截识别结果回调，替换为第三方引擎的返回文本。

## 免责声明

本项目仅供学习与个人使用，请遵守相关法律法规与平台服务条款。

## NOTICE

本项目 100% Vibe coding。
