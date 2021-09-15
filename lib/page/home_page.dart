import 'package:biodataku/common/constans.dart';
import 'package:biodataku/common/styles.dart';
import 'package:biodataku/dialog/exit_dialog.dart';
import 'package:biodataku/tool/helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Helper _helper;

  @override
  void initState() {
    super.initState();
    _helper = Helper();
  }

  Future<bool> _onWillPop() async {
    bool exit = await openExitDialog(context) ?? false;
    return Future.value(exit);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(kGAppName),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
      onWillPop: _onWillPop,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 128.0,
            height: 128.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                border: Border.all(color: primaryColor, width: 4.0),
                image: const DecorationImage(
                  image: AssetImage(kImgProfile),
                  fit: BoxFit.fitHeight,
                )),
          ),
          const SizedBox(height: 28.0),
          const Text(
            kSNama,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const Text(kSNim),
          const SizedBox(height: 32.0),
          const Text(
            "Tentang Saya",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const Text(
            kSDeskripsi,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: const [
              Text(
                "Hobi : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Expanded(child: Text(kSHobi)),
            ],
          ),
          const SizedBox(height: 32.0),
          const Text(
            "Kontak",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 16.0),
          _button(
            title: "Telepon",
            onTap: () => _helper.launcherIntent("tel:$kSTelepon"),
          ),
          _button(
            title: "WhatsApp",
            onTap: () => _helper.launcherIntent(kSWa),
          ),
          _button(
            title: "Email",
            onTap: () => _helper.launcherIntent(kSEmail),
          ),
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Alamat : "),
                      Expanded(child: Text(kSAlamatString)),
                    ],
                  ),
                  _button(
                    title: "Maps",
                    onTap: () => _helper.launcherIntent(
                        "https://goo.gl/maps/obdfm6YkrHNh8BJGA"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button({required String title, Function()? onTap}) {
    return MaterialButton(
      child: Text(title),
      minWidth: double.infinity,
      color: primaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: primaryColor,
          width: 2.0,
        ),
      ),
      onPressed: onTap,
    );
  }
}
