import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
