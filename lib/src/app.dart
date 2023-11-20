import 'dart:io';

import 'package:cobra_vault/src/pages/file_manager_page.dart';
import 'package:cobra_vault/src/provider/file_system_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Cobra Vault';

  // checkAndroidVersion() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //
  //   if (Platform.isAndroid) {
  //     var androidInfo = await DeviceInfoPlugin().androidInfo;
  //     var release = androidInfo.version.release;
  //     var sdkInt = androidInfo.version.sdkInt;
  //     var manufacturer = androidInfo.manufacturer;
  //     var model = androidInfo.model;
  //     print('Android $release (SDK $sdkInt), $manufacturer $model');
  //     // Android 9 (SDK 28), Xiaomi Redmi Note 7
  //   }
  // }

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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          // darkTheme: MyThemes.darkTheme,
          title: title,
          // home: FileManagerPage(),
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            if (settings.name == '/') {
              // MyFunction.requestPermission(Permission.storage);
              return MaterialPageRoute(
                builder: (context) {
                  return FileManagerPage();
                },
              );
            }
            return null;
          }),
    );
  }
}

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<File> _mediaFiles = [];

  @override
  void initState() {
    super.initState();
    _getMediaFiles();
  }

  Future<void> _getMediaFiles() async {
    final Directory? galleryDir = await getExternalStorageDirectory();
    final List<String> extensions = ['jpg', 'jpeg', 'png', 'mp4', 'mp3'];

    setState(() {
      _mediaFiles = galleryDir!
          .listSync(recursive: true, followLinks: false)
          .where((file) =>
              file is File &&
              extensions.contains(file.path.split('.').last.toLowerCase()))
          .toList()
          .cast<File>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: _mediaFiles.isNotEmpty
          ? ListView.builder(
              itemCount: _mediaFiles.length,
              itemBuilder: (context, index) {
                final file = _mediaFiles[index];
                final fileSize =
                    (file.lengthSync() / (1024 * 1024)).toStringAsFixed(2);
                return ListTile(
                  leading: Icon(Icons.image),
                  title: Text('${file.path.split('/').last}'),
                  subtitle: Text('Size: $fileSize MB'),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
