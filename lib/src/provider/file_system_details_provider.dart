import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storage_info/storage_info.dart';

class FileSystemDetailsProvider extends ChangeNotifier {
  String totalStorage = '';
  String usedStorage = '';

  String totalImageSize = '';
  String totalVideosSize = '';
  String totalAudiosSize = '';
  String totalDocumentsSize = '';

  int imageBytes = 0;
  int videoBytes = 0;
  int audioBytes = 0;
  int documentBytes = 0;

  final imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'HEIC',
  ];
  final videoExtensions = ['mp4', '3gp', 'webm', 'flv', 'mkv', 'avi'];

  // final audioExtensions = ['mp3', 'm4a', 'opus', 'wav'];
  final audioExtensions = ['mp3', 'm4a', 'amr'];

  final documentExtensions = [
    'doc',
    'docx',
    'pptx',
    'html',
    'htm',
    'odt',
    'pdf',
    'xls',
    'xlsx',
    'zip',
    'apk',
    'ppt',
    'txt'
  ];
  final galleryDirectoryPath = Directory('/storage/emulated/0/');

  // getPaths() async {
  //   print(
  //       "getApplicationDocumentsDirectory = ${await getApplicationDocumentsDirectory()}");
  //   print("Temporary = ${await getTemporaryDirectory()}");
  //   print("Application Support = ${await getApplicationSupportDirectory()}");
  //   print("External Storage = ${await getExternalStorageDirectory()}");
  //   print(
  //       "External Cache Directories = ${await getExternalCacheDirectories()}");
  //   print(
  //       "External Storage Directories = ${await getExternalStorageDirectories()}");
  // }

  getTotalStorage() async {
    double totStrg = await StorageInfo.getStorageTotalSpaceInGB;
    totalStorage = totStrg.toString();
    notifyListeners();
  }

  getUsedStorage() async {
    double usedStrg = await StorageInfo.getStorageUsedSpaceInGB;
    usedStorage = usedStrg.toString();
    notifyListeners();
  }

  //*******************************************
  // for images

  setImageSize(sz) {
    totalImageSize = sz;
    notifyListeners();
  }

  var allImageFiles = [];

  // starting point of image fetching
  galleryImageHandler() async {
    _getGalleryImageFiles(galleryDirectoryPath).then((_) async {
      // print("value = ${value.length}");
      print("allImageFiles = ${allImageFiles.length}");

      int imgByte = await loopingAllImageBytes(allImageFiles);
      // converting bytes to understandable format
      var sz = await convertImageByteToUndestandableFormat(imgByte, 2);
      setImageSize(sz);
    });
  }

  // recursive function which take file manager path and iterate on all folder inside it
  // save all image files in allImageFiles list.
  Future<List> _getGalleryImageFiles(galleryDirectory) async {
    final List<FileSystemEntity> galleryFiles = galleryDirectory.listSync();
    var singleFolderImage = [];

    singleFolderImage = galleryFiles.where((file) {
      // recursively calling function if there is a folder/directory
      if (!file.path.contains('.')) _getGalleryImageFiles(file);
      final extension = file.path.split('.').last.toLowerCase();
      // if (imageExtensions.contains(extension)) {
      //   singleFolderImage.add(file);
      // }
      return imageExtensions.contains(extension);
    }).toList();
    if (singleFolderImage.length > 0) {
      print("singleFolderImage = ${singleFolderImage.first}");
      allImageFiles.addAll(singleFolderImage);
    }

    return allImageFiles;
  }

  //****************************************************
  // for Audios

  setAudioSize(sz) {
    totalAudiosSize = sz;
    notifyListeners();
  }

  var allAudioFiles = [];

  // starting point of image fetching
  galleryAudioHandler() async {
    _getGalleryAudioFiles(galleryDirectoryPath).then((_) async {
      // print("value = ${value.length}");
      print("allAudioFiles = ${allAudioFiles.length}");

      int audioByte = await loopingAllAudioBytes(allAudioFiles);
      // converting bytes to understandable format
      var sz = await convertAudioByteToUndestandableFormat(audioByte, 2);
      setAudioSize(sz);
    });
  }

  // recursive function which take file manager path and iterate on all folder inside it
  // save all image files in allImageFiles list.
  Future<List> _getGalleryAudioFiles(galleryDirectory) async {
    final List<FileSystemEntity> galleryFiles = galleryDirectory.listSync();
    var singleFolderAudio;

    singleFolderAudio = galleryFiles.where((file) {
      // recursively calling function if there is a folder/directory
      if (!file.path.contains('.')) _getGalleryAudioFiles(file);
      print("audio file.path = ${file.path}");
      final extension = file.path.split('.').last.toLowerCase();
      return audioExtensions.contains(extension);
    }).toList();
    print("singleFolderAudio = ${singleFolderAudio.length}");
    if (singleFolderAudio.length > 0) {
      allAudioFiles.addAll(singleFolderAudio);
    }

    return allAudioFiles;
  }

  //****************************************************
  // for Videos

  setVideoSize(sz) {
    totalVideosSize = sz;
    notifyListeners();
  }

  var allVideoFiles = [];

  // starting point of image fetching
  galleryVideoHandler() async {
    _getGalleryVideoFiles(galleryDirectoryPath).then((_) async {
      // print("value = ${value.length}");
      print("allVideoFiles = ${allVideoFiles.length}");

      int videoByte = await loopingAllVideoBytes(allVideoFiles);
      // converting bytes to understandable format
      var sz = await convertVideoByteToUndestandableFormat(videoByte, 2);
      setVideoSize(sz);
    });
  }

  // recursive function which take file manager path and iterate on all folder inside it
  // save all image files in allImageFiles list.
  Future<List> _getGalleryVideoFiles(galleryDirectory) async {
    final List<FileSystemEntity> galleryFiles = galleryDirectory.listSync();
    var singleFolderVideo;

    singleFolderVideo = galleryFiles.where((file) {
      // recursively calling function if there is a folder/directory
      if (!file.path.contains('.')) _getGalleryVideoFiles(file);
      print("video file.path = ${file.path}");
      final extension = file.path.split('.').last.toLowerCase();
      return videoExtensions.contains(extension);
    }).toList();
    print("singleFolderVideo = ${singleFolderVideo.length}");
    if (singleFolderVideo.length > 0) {
      allVideoFiles.addAll(singleFolderVideo);
    }

    return allVideoFiles;
  }

  //****************************************************
  // for Documents

  setDocumentSize(sz) {
    totalDocumentsSize = sz;
    notifyListeners();
  }

  var allDocumentFiles = [];

  // starting point of image fetching
  // galleryDocumentHandler() async {
  //   _getGalleryDocumentFiles(galleryDirectoryPath).then((_) async {
  //     // print("value = ${value.length}");
  //     print("allDocumentFiles1 = ${allDocumentFiles.length}");
  //
  //     int documentByte = await loopingAllDocumentBytes(allDocumentFiles);
  //     // converting bytes to understandable format
  //     var sz = await convertDocumentByteToUndestandableFormat(documentByte, 2);
  //     setDocumentSize(sz);
  //   });
  // }

  // recursive function which take file manager path and iterate on all folder inside it
  // save all image files in allImageFiles list.
  // Future<List> _getGalleryDocumentFiles(galleryDirectory) async {
  //   final List<FileSystemEntity> galleryFiles = galleryDirectory.listSync();
  //   var singleFolderDocument;
  //
  //   singleFolderDocument = galleryFiles.where((file) {
  //     // recursively calling function if there is a folder/directory
  //     if (!file.path.contains('.')) _getGalleryDocumentFiles(file);
  //     print("documents file.path = ${file.path}");
  //     final extension = file.path
  //         .split('.')
  //         .last
  //         .toLowerCase();
  //     return documentExtensions.contains(extension);
  //   }).toList();
  //   print("singleFolderDocument = ${singleFolderDocument.length}");
  //   if (singleFolderDocument.length > 0) {
  //     allDocumentFiles.addAll(singleFolderDocument);
  //   }
  //
  //   return allDocumentFiles;
  // }

  // iterate over all list and get size od each file, add them and return them
  loopingAllImageBytes(allFiles) async {
    var totaBytes = 0;
    // dev.log("image allFiles = $allFiles");

    for (File element in allFiles) {
      // print("element image file: $element");
      int bytess = await element.length();
      totaBytes += bytess;
    }
    print("loopingAllImageBytes: $totaBytes");
    return totaBytes;
  }

  convertImageByteToUndestandableFormat(bytes, int decimals) async {
    print("image bytes: $bytes");
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  loopingAllAudioBytes(allFiles) async {
    int totaBytes = 0;
    for (var element in allFiles) {
      int bytess = await element.length();
      totaBytes += bytess;
    }
    return totaBytes;
  }

  convertAudioByteToUndestandableFormat(bytes, int decimals) async {
    print("audio bytes: $bytes");

    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  loopingAllVideoBytes(allFiles) async {
    int totaBytes = 0;
    for (var element in allFiles) {
      int bytess = await element.length();
      totaBytes += bytess;
    }
    return totaBytes;
  }

  convertVideoByteToUndestandableFormat(bytes, int decimals) async {
    print("video bytes: $bytes");

    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  loopingAllDocumentBytes(allFiles) async {
    int totaBytes = 0;
    for (var element in allFiles) {
      int bytess = await element.length();
      totaBytes += bytess;
    }
    return totaBytes;
  }

  convertDocumentByteToUndestandableFormat(bytes, int decimals) async {
    print("document bytes: $bytes");

    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  // starting point of image fetching
  combinedGalleryDocumentHandler() async {
    allVideoFiles.clear();
    allAudioFiles.clear();
    allDocumentFiles.clear();
    allImageFiles.clear();
    _combinedGetGalleryDocumentFiles(galleryDirectoryPath).then((_) async {
      // print("value = ${value.length}");
      print("allDocumentFiles = ${allDocumentFiles.length}");

      int imgByte = await loopingAllImageBytes(allImageFiles);
      // converting bytes to understandable format

      var sz =
          await convertImageByteToUndestandableFormat(imgByte, 2).then((sz) {
        setImageSize(sz);
      });

      int audioByte = await loopingAllAudioBytes(allAudioFiles);
      // converting bytes to understandable format
      var sz1 =
          await convertAudioByteToUndestandableFormat(audioByte, 2).then((sz1) {
        setAudioSize(sz1);
      });

      int videoByte = await loopingAllVideoBytes(allVideoFiles);
      // converting bytes to understandable format
      var sz2 =
          await convertVideoByteToUndestandableFormat(videoByte, 2).then((sz2) {
        setVideoSize(sz2);
      });

      int documentByte = await loopingAllDocumentBytes(allDocumentFiles);
      // converting bytes to understandable format
      var sz3 = await convertDocumentByteToUndestandableFormat(documentByte, 2)
          .then((sz3) {
        setDocumentSize(sz3);
      });
    });
  }

  // recursive function which take file manager path and iterate on all folder inside it
  // save all image files in allImageFiles list.
  Future<List> _combinedGetGalleryDocumentFiles(galleryDirectory) async {
    Directory dr;
    // dr.l
    final List<FileSystemEntity> galleryFiles = galleryDirectory.listSync();
    var singleFolderImage = [];
    var singleFolderAudio = [];
    var singleFolderVideo = [];
    var singleFolderDocument = [];

    // singleFolderDocument =
    galleryFiles.where((file) {
      var extension =
          ''; // recursively calling function if there is a folder/directory
      if (!file.path.contains('Android')) {
        if (!file.path.contains('.')) _combinedGetGalleryDocumentFiles(file);
        print("documents file.path = ${file.path}");

        extension = file.path.split('.').last.toLowerCase();

        if (imageExtensions.contains(extension)) {
          print("image");
          singleFolderImage.add(file);
        } else if (audioExtensions.contains(extension)) {
          print("audio");
          singleFolderAudio.add(file);
        } else if (videoExtensions.contains(extension)) {
          print("video");
          singleFolderVideo.add(file);
        } else if (documentExtensions.contains(extension)) {
          print("document");
          singleFolderDocument.add(file);
        }
      }
      return documentExtensions.contains(extension);
    }).toList();

    // print("singleFolderDocument = ${singleFolderDocument.length}");

    if (singleFolderImage.length > 0) {
      // print("singleFolderImage = ${singleFolderImage.first}");
      allImageFiles.addAll(singleFolderImage);
    }
    if (singleFolderAudio.length > 0) {
      allAudioFiles.addAll(singleFolderAudio);
    }
    if (singleFolderVideo.length > 0) {
      allVideoFiles.addAll(singleFolderVideo);
    }
    if (singleFolderDocument.length > 0) {
      allDocumentFiles.addAll(singleFolderDocument);
    }

    return allDocumentFiles;
  }
}
