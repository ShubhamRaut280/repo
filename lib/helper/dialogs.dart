// import 'dart:js';

import 'package:flutter/material.dart';

class Dialogs {
  // for no internet exception
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.fixed,
    ));
  }

  // for loading indicator
  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(child: CircularProgressIndicator()));
  }
}
