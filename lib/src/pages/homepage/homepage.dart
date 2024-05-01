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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Cobra Vault'),
      body: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
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
