import 'dart:math';

import 'package:cobra_vault/src/provider/file_system_details_provider.dart';
import 'package:cobra_vault/src/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) {
      FileSystemDetailsProvider();
    }),
    ChangeNotifierProvider(create: (_) {
      ThemeProvider();
    })
  ], child: MyApp()));
  // print("size = ${getGalleryImageSize()}");
}
