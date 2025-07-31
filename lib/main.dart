// ──────────────────────────────────────────────────────────────────────────────
// 앱 진입점(main.dart):
// 1) ProviderScope로 앱 전체를 감싸 Riverpod 사용 준비
// 2) MyApp에서 HomePage를 첫 화면으로 설정
// ──────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';  // Riverpod 패키지 임포트

import 'pages/home_page.dart';

void main() {
  // ProviderScope: Riverpod 상태 관리 범위 지정
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Search App',
      debugShowCheckedModeBanner: false,                // 디버그 배지 제거

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,               // 앱 전체 주 색상
      ),

      home: const HomePage(),                           // 첫 화면으로 HomePage 지정
    );
  }
}
