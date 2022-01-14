// ignore_for_file: prefer_const_constructors

import 'package:firebase_deneme/color.dart';
import 'package:firebase_deneme/screens/main/main_screen.dart';
import 'package:firebase_deneme/screens/welcome/welcome_background.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Doktorların hastalarla özel olarak ilgilenebildiği\nHastaların alanında uzman doktorlara özel olarak şikayetlerini belirtebildiği uygulamammıza",
            textAlign: TextAlign.center,
            style: TextStyle(
                /*fontFamily: 'Lobster',*/
                fontSize: 15.0,
                fontStyle: FontStyle.italic,
                color: kSecondaryPrimaryColor),
          ),
          SizedBox(height: size.height * 0.05),
          const Text(
            "HOŞGELDİNİZ",
            textAlign: TextAlign.center,
            style: TextStyle(
                /*fontFamily: 'Lobster',*/
                fontSize: 35.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color(0xFF04146D)),
          ),
          SizedBox(height: size.height * 0.15),
          Container(
            padding: EdgeInsets.all(10.0),
            height: size.height * 0.1,
            width: size.width * 0.6,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: ElevatedButton(
              child: const Text(
                "HADİ BAŞLAYALIM!",
                style: TextStyle(color: Color(0xFF04146D)),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
