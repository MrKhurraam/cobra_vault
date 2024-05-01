import 'package:cobra_vault/src/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return CircleAvatar(
      radius: 16,
      backgroundColor: Theme.of(context).cardColor,
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          themeProvider.setThemeMode =
              themeProvider.isDarkMode ? ThemeMode.light : ThemeMode.dark;
        },
        icon: Icon(
          themeProvider.isDarkMode
              ? Icons.light_mode
              : Icons.dark_mode_outlined,
          size: 16,
        ),
      ),
    );
  }
}
