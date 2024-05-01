import 'dart:io';

import 'package:cobra_vault/src/pages/file_manager_page.dart';
import 'package:cobra_vault/src/provider/file_system_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'helpers/route_generator.dart';
import 'provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FileSystemDetailsProvider(),
        ),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Cobra Vault';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set the theme mode dynamically based on the ThemeProvider's value
      themeMode: context.watch<ThemeProvider>().themeMode,
      // Set the theme based on the selected theme mode
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,

      title: title,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
