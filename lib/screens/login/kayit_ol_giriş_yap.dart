// ignore_for_file: file_names

import 'package:firebase_deneme/animations/main_screen_animation.dart';
import 'package:firebase_deneme/color.dart';
import 'package:firebase_deneme/screens/login/signup.dart';
import 'package:firebase_deneme/screens/login/kayitol_girisyap_background.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class KayitolGirisYap extends StatelessWidget {
  final bool patient;
  const KayitolGirisYap({this.patient = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KayitOlGirisYapBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.15),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: size.height * 0.08,
              width: size.width * 0.7,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, ScaleRoute(page: DoctorSignup()));
                  },
                  child: const Text(
                    'KAYIT OL',
                    style: TextStyle(fontSize: 20.0, color: kPrimaryColor),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF436CA4))),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              " ZATEN BİR HESABIN VAR MI?",
              style: TextStyle(color: Color(0xFF04146D), fontSize: 15.0),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: size.height * 0.08,
              width: size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, ScaleRoute(page: const Login()));
                },
                child: const Text(
                  'GİRİŞ YAP',
                  style: TextStyle(fontSize: 20.0, color: Color(0xFF04146D)),
                ),
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
