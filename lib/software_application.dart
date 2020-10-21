import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:umeng_analytics_plugin/umeng_analytics_plugin.dart';
import 'dart:async';

class SoftwareApplication {
  static SoftwareApplication instance;
  static SoftwareApplication getInstance() {
    if (instance == null) {
      instance = SoftwareApplication();
    }
    return instance;
  }

  void onCreate() {
    initUmengAnalyticsPlugin();
    initBuglyPlugin();
  }

  Future<void> initBuglyPlugin() async {
    FlutterBugly.init(androidAppId: "83857508ff", iOSAppId: "cd52ffc48e")
        .then((value) {
      print("Bugly_Log  => ${value.message}");
    });
  }

  Future<void> initUmengAnalyticsPlugin() async {
    var result = await UmengAnalyticsPlugin.init(
      androidKey: '5f87ec5594846f78a9735279',
      iosKey: '5f87ec9594846f78a97352a3',
      logEnabled: true,
    );
    String res = result ? 'Umeng 初始化成功' : 'Umeng initialized ERROR';
    print('Umeng_Log  => $res');
  }
}
