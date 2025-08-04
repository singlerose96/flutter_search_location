// 앱 진입점(main.dart)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';  // Riverpod 패키지 임포트

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/home_page.dart';
import 'pages/review_page.dart';



/// 앱 진입점: Firebase 초기화 후 ProviderScope로 MyApp 실행
Future<void> main() async {
  // Flutter 바인딩 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 앱 초기화 (firebase_options.dart 사용)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Riverpod 상태 관리 범위 지정 후 앱 실행
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
      debugShowCheckedModeBanner: false, // 디버그 배지 제거

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

// 초기 라우트 및 경로별 화면 지정
      initialRoute: '/',
      routes: {
        '/':      (context) => const HomePage(),
        '/review':(context) => const ReviewPage(),
      },
    );
  }
}