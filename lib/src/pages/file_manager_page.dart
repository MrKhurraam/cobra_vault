// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_file_manager/flutter_file_manager.dart';
//
// class FileManagerPage extends StatefulWidget {
//   @override
//   _FileManagerPageState createState() => _FileManagerPageState();
// }
//
// class _FileManagerPageState extends State<FileManagerPage> {
//   List<File> _files = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     // final files = await FileManager(root: '/', filter: ['jpg']);
//     final files = await FileManager(root: Directory('/'));
//     // files(
//     //   rootPath: '/',
//     //   extensions: ['jpg', 'jpeg', 'png', 'gif', 'mp4', 'avi', 'mkv', 'mov'],
//     // );
//
//     final fileSizes = await Future.wait(files.map((file) => file.length()));
//
//     setState(() {
//       _files = files;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Manager'),
//       ),
//       body: ListView.builder(
//         itemCount: _files.length,
//         itemBuilder: (context, index) {
//           final file = _files[index];
//
//           return ListTile(
//             leading: Icon(Icons.file_copy_outlined),
//             title: Text(file.path),
//             subtitle: Text('Size: ${file.lengthSync()} bytes'),
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:file_manager/controller/file_manager_controller.dart';
// import 'package:file_manager/file_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';
//
// class FileManagerPage extends StatefulWidget {
//   @override
//   _FileManagerPageState createState() => _FileManagerPageState();
// }
//
// class _FileManagerPageState extends State<FileManagerPage> {
//   var _files = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // _getFiles();
//   }
//
//   Future<void> _getFiles() async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     final files = await directory.list().toList();
//     print("files = $files");
//     setState(() {
//       _files = files
//           .where((entity) =>
//               entity is File &&
//               (path.extension(entity.path) == '.jpg' ||
//                   path.extension(entity.path) == '.jpeg' ||
//                   path.extension(entity.path) == '.png' ||
//                   path.extension(entity.path) == '.mp4'))
//           .toList();
//     });
//   }
//
//   final FileManagerController controller = FileManagerController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Manager'),
//       ),
//       body: FileManager(
//         controller: controller,
//         builder: (context, snapshot) {
//           final List<FileSystemEntity> entities = snapshot;
//           return ListView.builder(
//             itemCount: entities.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: ListTile(
//                   leading: FileManager.isFile(entities[index])
//                       ? Icon(Icons.feed_outlined)
//                       : Icon(Icons.folder),
//                   title: Text(FileManager.basename(entities[index])),
//                   onTap: () {
//                     if (FileManager.isDirectory(entities[index])) {
//                       controller
//                           .openDirectory(entities[index]); // open directory
//                     } else {
//                       // Perform file-related tasks.
//                     }
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:math';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:cobra_vault/src/provider/file_system_details_provider.dart';
import 'package:cobra_vault/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../helpers/functions.dart';

class FileManagerPage extends StatefulWidget {
  @override
  _FileManagerPageState createState() => _FileManagerPageState();
}

class _FileManagerPageState extends State<FileManagerPage>
    with WidgetsBindingObserver {
  List<File> _galleryFiles = [];

  late FileSystemDetailsProvider fileSystemDetailsProvider;

  // @override
  // Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
  //   if (state == AppLifecycleState.resumed) {
  //     if (await Permission.storage.isGranted) {
  //       print("permission granted2");
  //       fileSystemDetailsProvider.getPaths();
  //       fileSystemDetailsProvider.combinedGalleryDocumentHandler();
  //       fileSystemDetailsProvider.galleryImageHandler();
  //       fileSystemDetailsProvider.galleryAudioHandler();
  //       fileSystemDetailsProvider.galleryVideoHandler();
  //       fileSystemDetailsProvider.galleryDocumentHandler();
  //       fileSystemDetailsProvider.getTotalStorage();
  //       fileSystemDetailsProvider.getUsedStorage();
  //     }
  //     print("inside splash AppLifcycleState resumed");
  //   } else {}
  //   // setState(() {
  //   //   _stateHistoryList.add(state);
  //   // });
  // }

  getPermission() async {
    await MyFunction.requestPermission(Permission.storage);
    // await MyFunction.requestPermission(Permission.manageExternalStorage);

    // fileSystemDetailsProvider.getPaths();
    // if (permission) {
    //   print("permission granted2");
    //   fileSystemDetailsProvider.getPaths();
    //   fileSystemDetailsProvider.combinedGalleryDocumentHandler();
    //   // fileSystemDetailsProvider.galleryImageHandler();
    //   // fileSystemDetailsProvider.galleryAudioHandler();
    //   // fileSystemDetailsProvider.galleryVideoHandler();
    //   // fileSystemDetailsProvider.galleryDocumentHandler();
    //   fileSystemDetailsProvider.getTotalStorage();
    //   fileSystemDetailsProvider.getUsedStorage();
    // } else {
    //   SnackBar(
    //     content: Text('Need Storage Permission to access file size.'),
    //     padding: EdgeInsets.all(20),
    //     backgroundColor: Colors.purple[300],
    //   );
    //   await openAppSettings();
    // }
    if (await Permission.storage.isGranted) {
      print("permission granted1");
      fileSystemDetailsProvider.combinedGalleryDocumentHandler();
      // fileSystemDetailsProvider.galleryImageHandler();
      // fileSystemDetailsProvider.galleryAudioHandler();
      // fileSystemDetailsProvider.galleryVideoHandler();
      // fileSystemDetailsProvider.galleryDocumentHandler();
      fileSystemDetailsProvider.getTotalStorage();
      fileSystemDetailsProvider.getUsedStorage();
    } else {
      SnackBar(
        content: Text('Need Storage Permission to access file size.'),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.purple[300],
      );
      await openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    fileSystemDetailsProvider =
        Provider.of<FileSystemDetailsProvider>(context, listen: false);

    WidgetsBinding.instance.addObserver(this);

    getPermission();
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitWave(
      color: Colors.purple[200],
      size: 20.0,
    );

    return Scaffold(
      appBar: MyAppBar(
        title: 'File System Info',
        centerTitle: true,
        showActionButtons: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        children: [
          Consumer<FileSystemDetailsProvider>(
              builder: (context, storageDetails, child) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              margin: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: Offset.zero,
                    )
                  ]),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(storageDetails.totalStorage.isEmpty
                      ? "Calculating Total Storage..."
                      : "Total Storage:"),
                  SizedBox(
                    width: 20,
                  ),
                  storageDetails.totalStorage.isEmpty
                      ? spinkit
                      : Text("${storageDetails.totalStorage} GB"),
                ],
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Consumer<FileSystemDetailsProvider>(
              builder: (context, storageDetails, child) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              margin: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset.zero,
                    )
                  ]),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(storageDetails.usedStorage.isEmpty
                      ? "Calculating Used Storage..."
                      : "Storage Used:"),
                  SizedBox(
                    width: 20,
                  ),
                  storageDetails.usedStorage.isEmpty
                      ? spinkit
                      : Text("${storageDetails.usedStorage} GB"),
                ],
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Consumer<FileSystemDetailsProvider>(
              builder: (context, imageDetails, child) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              margin: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset.zero,
                    )
                  ]),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(imageDetails.totalImageSize.isEmpty
                      ? "Calculating Image Size..."
                      : "Image Sizes:"),
                  SizedBox(
                    width: 20,
                  ),
                  imageDetails.totalImageSize.isEmpty
                      ? spinkit
                      : Text(imageDetails.totalImageSize.toString()),
                ],
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Consumer<FileSystemDetailsProvider>(
              builder: (context, audioDetails, child) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset.zero,
                    )
                  ]),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(audioDetails.totalAudiosSize.isEmpty
                      ? "Calculating Audio Size..."
                      : "Audio Sizes:"),
                  SizedBox(
                    width: 20,
                  ),
                  audioDetails.totalAudiosSize.isEmpty
                      ? spinkit
                      : Text(audioDetails.totalAudiosSize.toString()),
                ],
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Consumer<FileSystemDetailsProvider>(
              builder: (context, videoDetails, child) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset.zero,
                    )
                  ]),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(videoDetails.totalVideosSize.isEmpty
                      ? "Calculating Video Size..."
                      : "Video Sizes:"),
                  SizedBox(
                    width: 20,
                  ),
                  videoDetails.totalVideosSize.isEmpty
                      ? spinkit
                      : Text(videoDetails.totalVideosSize.toString()),
                ],
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Consumer<FileSystemDetailsProvider>(
              builder: (context, documentDetails, child) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset.zero,
                    )
                  ]),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(documentDetails.totalDocumentsSize.isEmpty
                      ? "Calculating Document Size..."
                      : "Document Sizes:"),
                  SizedBox(
                    width: 20,
                  ),
                  documentDetails.totalDocumentsSize.isEmpty
                      ? spinkit
                      : Text(documentDetails.totalDocumentsSize.toString()),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
