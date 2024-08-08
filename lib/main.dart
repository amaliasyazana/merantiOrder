import '../views/login/loginpage.dart';
import 'package:flutter/material.dart';
import '../configs/service_locator.dart';

void main() {
  initializeServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meranti Diner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(120, 196, 164, 1.000),
          ),
          useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}
