import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/home_page.dart' show HomePage;
import 'registry/registry.dart' show buildComponentRoutes;

void main() {
  runApp(const FlutterPressApp());
}

class FlutterPressApp extends StatelessWidget {
  const FlutterPressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 组件案例集',
      debugShowCheckedModeBanner: false,
      locale: const Locale('zh'),
      supportedLocales: const [Locale('zh'), Locale('en')],
      // 内置控件（如日期选择器、返回按钮提示）的文案由下面三个 delegate 提供，
      // 必须配合 supportedLocales 一起用；缺了它们即使 locale 是 zh，控件仍显示英文。
      localizationsDelegates: const [
        // Material 风格控件的中文文案
        GlobalMaterialLocalizations.delegate,
        // 通用 Widget 的本地化：文字方向、默认语义标签等
        GlobalWidgetsLocalizations.delegate,
        // Cupertino（iOS 风格）控件的中文文案
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        // 控件疏密随平台自适应：桌面端取 compact（元素更紧凑），移动端取 standard（手指更好点）
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      routes: buildComponentRoutes(), // 路由表
    );
  }
}
