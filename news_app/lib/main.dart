import 'package:flutter/material.dart';
import 'package:news_app/Features/news_home/UI/news_screen.dart';
import 'package:news_app/cores/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themes.lightTheme,
      home: NewsScreen(),
    );
  }
}
