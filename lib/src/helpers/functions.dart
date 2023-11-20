import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyFunction {

  static Future<bool> requestPermission(Permission permission) async {
    await permission.request();
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    
    if (await permission.isDenied) {
      SnackBar(
        content: Text('Need Storage Permission to access file size.'),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.purple[300],
      );
      SnackBar(
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            // Code to execute.
          },
        ),
        content: const Text('Need Storage Permission to access file size!'),
        duration: const Duration(milliseconds: 1500),
        width: 280.0,
        // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      );
      await openAppSettings();
    }
    return false;
  }
}
