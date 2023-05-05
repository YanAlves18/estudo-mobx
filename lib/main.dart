import 'package:flutter/material.dart';

import 'login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // tema claro
      darkTheme: ThemeData.dark(), // tema escuro
      themeMode: ThemeMode.system, // modo de tema automático
      home: const LoginScreen(),
    );
  }
}