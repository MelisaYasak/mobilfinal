import 'package:flutter/material.dart';
import '../../color.dart';
import 'login.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkPrimaryColor,
      body: AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text("Çıkış Yapılıyor"),
        content: const Text("Çıkmak istediğinizden emin misiniz?"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: MaterialButton(
              shape: const StadiumBorder(),
              minWidth: 100,
              color: kLightPrimaryColor,
              child: const Text("Evet"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ),
          MaterialButton(
            shape: const StadiumBorder(),
            minWidth: 100,
            color: kDarkPrimaryColor,
            child: const Text("Hayır"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
