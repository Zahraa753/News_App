import 'package:appone/core/style/themes.dart';
import 'package:appone/features/home/logic/home_provider.dart';
import 'package:appone/features/home/ui/home_screen.dart';
import 'package:appone/features/login/ui/login_screen.dart';
import 'package:appone/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print(FirebaseAuth.instance.currentUser?.uid);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        home: FirebaseAuth.instance.currentUser?.uid != null
            ? HomeScreen()
            : LoginScreen(),
      ),
    );
  }
}
