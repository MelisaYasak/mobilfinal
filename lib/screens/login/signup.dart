// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:firebase_deneme/rest/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../color.dart';
import 'kayit_ol.dart';

Timer _timer = new Timer(Duration(milliseconds: 400), () {});

class DoctorSignup extends StatefulWidget {
  DoctorSignup({Key? key}) : super(key: key);

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  String password = '';
  TextEditingController tc = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isPasswordVisible2 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Container(
              height: size.height * 0.25,
              padding: const EdgeInsets.all(40),
              child: Image.asset("assets/icons/plus.png"), // hasta resmi
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kLightPrimaryColor),
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'İSİM SOYİSİM',
                  icon:
                      Icon(Icons.accessibility, color: kSecondaryPrimaryColor),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kLightPrimaryColor),
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: tc,
                decoration: const InputDecoration(
                  hintText: 'XXXXXXXXXXX',
                  labelText: 'T.C. KİMLİK NUMARASI',
                  icon: Icon(Icons.mail, color: kSecondaryPrimaryColor),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kLightPrimaryColor),
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: pass,
                obscureText: _isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '*********',
                  labelText: 'Parola',
                  suffixIcon: IconButton(
                    icon: _isPasswordVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  icon: const Icon(Icons.lock, color: kSecondaryPrimaryColor),
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kLightPrimaryColor),
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: pass2,
                obscureText: _isPasswordVisible2,
                decoration: InputDecoration(
                  hintText: '*********',
                  labelText: 'Parola Tekrar',
                  suffixIcon: IconButton(
                    icon: _isPasswordVisible2
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible2 = !_isPasswordVisible2;
                      });
                    },
                  ),
                  icon: const Icon(Icons.lock, color: kSecondaryPrimaryColor),
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: kLightPrimaryColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(' İPTAL',
                        style: TextStyle(color: Colors.black, fontSize: 15.0))),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kLightPrimaryColor,
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? unvan = prefs.getString("unvan");
                      await saveUser(tc.text, pass.text, name.text, unvan!,
                          (jTrue) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KayitOl()),
                        );
                      }, (jFalse) {
                        showDialog(
                            context: context,
                            builder: (BuildContext builderContext) {
                              _timer = Timer(Duration(seconds: 3), () {
                                pass.text = "";
                                Navigator.of(context).pop();
                              });
                              return Container(
                                width: size.width * 0.9,
                                child: AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Icon(
                                    Icons.error,
                                    size: size.width * 0.3,
                                  ),
                                  content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(jFalse["message"]
                                            .toString()
                                            .trim()),
                                      ]),
                                ),
                              );
                            }).then((val) async {
                          if (_timer.isActive) {
                            _timer.cancel();
                          }
                        });
                      });
                    },
                    child: const Text(' KAYIT OL',
                        style: TextStyle(
                            color: Color(0xFF04146D), fontSize: 15.0))),
                const SizedBox(height: 10),
              ],
            ),
          ]),
        ));
  }
}
