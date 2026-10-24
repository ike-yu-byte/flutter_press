import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/home_page.dart';
import 'registry/registry.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      routes: buildComponentRoutes(),
    );
  }
}
