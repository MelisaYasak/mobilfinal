import 'package:firebase_deneme/animations/main_screen_animation.dart';
import 'package:firebase_deneme/screens/login/kayit_ol_giri%C5%9F_yap.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen_background.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainScreenBackground(
        child: SingleChildScrollView(
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            const Text(
              "Öncelikle kim olarak giriş yapmak istediğini seçmelisin",
              textAlign: TextAlign.center,
              style: TextStyle(
                  /*fontFamily: 'Lobster',*/
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              height: 200,
              alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset("assets/images/doctor.png"),
                iconSize: 220,
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("unvan", "doktor");
                  Navigator.push(
                      context, ScaleRoute(page: const KayitolGirisYap()));
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              height: 200,
              alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset("assets/images/patient.png"),
                iconSize: 250,
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("unvan", "hasta");
                  Navigator.push(
                      context, ScaleRoute(page: const KayitolGirisYap()));
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            )
          ],
        ),
      ]),
    ));
  }
}
