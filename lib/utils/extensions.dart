import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ToastExtension on String {
  void get toast {
    Fluttertoast.showToast(
      msg: toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 18,
    );
  }
}