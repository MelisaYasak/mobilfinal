import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../color.dart';

class PasswordUpdate extends StatelessWidget {
  const PasswordUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BoxDecoration decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), color: kLightPrimaryColor);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                  '**Şifren altı(6) karakterden uzun olmalı ve rakamlar, harfler ve özel karakterlerden (! % @) oluşmalıdır '),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.10,
              decoration: decoration,
              padding: const EdgeInsets.all(15.0),
              child: buildInput("Mevcut Şifren"),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.10,
              decoration: decoration,
              padding: const EdgeInsets.all(15.0),
              child: buildInput("Yeni Şifren"),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.10,
              decoration: decoration,
              padding: const EdgeInsets.all(15.0),
              child: buildInput("Yeni Şifren Tekrar"),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                _isChange(context);
              },
              child: const Text("DEĞİŞTİR"),
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          border: const UnderlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _isChange(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Text("Siliniyor..."),
      content: const Text("Silmek istediğinizden emin misiniz?"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: MaterialButton(
            shape: const StadiumBorder(),
            minWidth: 100,
            color: kLightPrimaryColor,
            child: const Text("Evet"),
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Başarıyla Silindi",
              );
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
    );
  }
}
