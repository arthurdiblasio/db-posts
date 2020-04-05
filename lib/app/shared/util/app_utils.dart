import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppUtils {
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "${packageInfo.version}";
  }

  static Future<bool> asyncConfirmDialog(
      BuildContext context, String title, String description) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            FlatButton(
              child: const Text('NÃO'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: const Text('SIM'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }

  static Future<void> defaultDialog(
      BuildContext context, String title, String description, bool hasButton,
      {String buttonText, double sizeTitle}) async {
    return Container();
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) => DefaultDialog(
    //     title: title,
    //     sizeTitle: sizeTitle,
    //     description: description,
    //     hasButton: true,
    //     buttonText: buttonText != null ? buttonText : null,
    //   ),
    // );
  }
}
