import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper{
  Future exitApp() {
    return Platform.isIOS ? exit(0) : SystemNavigator.pop(animated: true);
  }

  Future jumpToPage(BuildContext context, {required Widget page}) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  Future moveToPage(BuildContext context, {required Widget page}) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  void backToRootPage(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Future launcherIntent(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}