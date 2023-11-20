import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:photo_manager/photo_manager.dart';
import '../../widgets/app_bar.dart';
import 'components/cloud_backup_card.dart';
import 'components/gallery_grid.dart';
import 'components/storage_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // getGalleryImageSize() async {
  //   final PermissionState _ps = await PhotoManager.requestPermissionExtend();
  //   if (_ps.isAuth) {
  //     // Granted.
  //     final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
  //     paths.forEach((element) {
  //       print("element = ${element.fetchPathProperties()}");
  //     });
  //     // print("orig paths = ${paths.length}");
  //   } else {
  //     // Limited(iOS) or Rejected, use `==` for more precise judgements.
  //     // You can call `PhotoManager.openSetting()` to open settings for further steps.
  //   }
  //
  //   // int imageSize = 0;
  //   // final Directory? galleryDirectory =
  //   //     await getApplicationDocumentsDirectory(); // Change to your gallery directory
  //   // print("galleryDirectory = $galleryDirectory");
  //   // try {
  //   //   final List<FileSystemEntity>? files =
  //   //       galleryDirectory!.listSync(recursive: true);
  //   //   print("files = $files");
  //   //   for (FileSystemEntity entity in files!) {
  //   //     if (entity is File &&
  //   //         (entity.path.endsWith('.jpg') || entity.path.endsWith('.png'))) {
  //   //       imageSize += await entity.length();
  //   //       print("imageSize = $imageSize");
  //   //     }
  //   //   }
  //   // } catch (e) {
  //   //   print(e.toString());
  //   // }
  //
  //   // return imageSize;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Cobra Vault'),
      body: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // getGalleryImageSize();
                  },
                  child: Text("check sze")),
              GalleryGrid(),
              StorageDetails(),
              CloudBackup(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          enableFeedback: false,
          currentIndex: 0,
          onTap: (value) {
            if (value == 2) {
              Navigator.pushNamed(context, 'settings');
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(CupertinoIcons.home),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(CupertinoIcons.heart),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(CupertinoIcons.settings),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(Icons.cloud_download_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
