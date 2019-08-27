# flutter_stdudy

A new Flutter project.

## Getting Started

1.app基本框架

启动画面 启动显示广告

登录页面 软键盘 校验 webview(显示隐私协议)

主界面 tab页面 drawer

多国语言

[flutter_localizations](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

internationalization

[intl_translation](https://pub.dev/packages/intl_translation)

```shell
flutter pub run intl_translation:extract_to_arb --output-dir=i10n-arb lib/i10n/localization_intl.dart
flutter pub run intl_translation:generate_from_arb --output-dir=lib/i10n --no-use-deferred-loading lib/i10n/localization_intl.dart i10n-arb/intl_*.arb
```

路由

[Navigator](https://flutter.dev/docs/development/ui/navigation)

[fluro](https://pub.dev/packages/fluro)

全局状态管理

[provider](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)

网络请求

[json](https://flutter.dev/docs/development/data-and-backend/json)

数据本地保存

toast 弹窗 actionsheet

分享

应用升级

统计分析

打包分发程序


2.常用组件

下拉刷新 上滑更多

左滑删除

3.动画

页面过渡动画

4.native组件

webview 桥接功能

地图

5.native api

选择图片 视频 音频 录音 相机

location

文件操作

wifi 蓝牙 电量 网络状态 电话 陀螺仪 扫码 震动
