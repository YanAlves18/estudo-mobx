import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tema',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text(themeModel.isDarkMode ? 'Tema Claro' : 'Tema Escuro'),
              value: themeModel.isDarkMode,
              onChanged: (_) => themeModel.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}