import 'package:biodataku/common/configs.dart';
import 'package:biodataku/common/constans.dart';
import 'package:biodataku/common/styles.dart';
import 'package:biodataku/page/splash_page.dart';
import 'package:flutter/material.dart';

class BiodataKu extends StatelessWidget {
  const BiodataKu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kGAppName,
      theme: tdMain,
      localizationsDelegates: kLDelegates,
      supportedLocales: kLSupports,
      home: const SplashPage(),
    );
  }
}