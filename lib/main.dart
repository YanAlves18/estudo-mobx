import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/login_screen.dart';
import 'login/login_store.dart';
import 'model/theme_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Brightness platformBrightness = WidgetsBinding.instance!.window.platformBrightness;
  final bool isDarkMode = platformBrightness == Brightness.dark;

  runApp(
    MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
        ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel(isDarkMode),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const LoginScreen(),
        );
      },
    );
  }
}
