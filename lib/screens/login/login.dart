// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:firebase_deneme/rest/rest_api.dart';
import 'package:firebase_deneme/screens/patient/patient_home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../color.dart';
import '../../animations/animasyon_slide.dart';
import '../doctor/doctor_home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _tcController = new TextEditingController();
  final TextEditingController _parolaController = new TextEditingController();

  BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10.0), color: kLightPrimaryColor);
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: size.height * 0.3,
                  padding: const EdgeInsets.all(10.0),
                  child: const DoctorLoginImageAnimation()),
              const SizedBox(height: 10.0),
              Container(
                  width: size.width * 0.9,
                  height: size.height * 0.1,
                  decoration: decoration,
                  padding: const EdgeInsets.all(10.0),
                  child: buildInput()),
              const SizedBox(height: 10.0),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.1,
                decoration: decoration,
                padding: const EdgeInsets.all(10.0),
                child: buildPassInput(),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kLightPrimaryColor),
                  onPressed: () {
                    _tcController.text.isNotEmpty &&
                            _parolaController.text.isNotEmpty
                        ? doLogin(_tcController.text, _parolaController.text)
                        : Fluttertoast.showToast(
                            msg: "All fields are required",
                            textColor: Colors.red);
                  },
                  child: const Text(' GİRİŞ YAP',
                      style:
                          TextStyle(color: Color(0xFF04146D), fontSize: 25.0)))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        controller: _tcController,
        obscureText: false,
        decoration: InputDecoration(
          //hintText: 'XXXXXXXXXXX',
          //labelText: 'T.C. KİMLİK NUMARASI',
          icon: Image.asset("assets/icons/id_card_icon.png"),
          border: const UnderlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildPassInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        controller: _parolaController,
        obscureText: _isObscure,
        decoration: InputDecoration(
          //hintText: '*********',
          //labelText: 'Parola',
          suffixIcon: IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              }),
          icon: const Icon(Icons.lock, color: kSecondaryPrimaryColor),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

  doLogin(String hastaTC, String hastaParola) async {
    await userLogin(hastaTC.trim(), hastaParola.trim(), (jsonTrue) async {
      if (jsonTrue["seviye"].toString() == "doktor") {
        Route route = MaterialPageRoute(builder: (_) => const DoctorHomePage());
        Navigator.pushReplacement(context, route);
      } else {
        await getDoktor((tJson) async {
          String doktorlar = "";
          String uzmanlik = "";
          List<dynamic> doktorlist = [];
          List<dynamic> uzmanliklist = [];
          for (var item in tJson["messsage"]) {
            doktorlar = "{\"doktorID\":\"" +
                item["doktorID"].toString() +
                "\",\"doktorAd\":\"" +
                item["doktorAd"] +
                "\",\"doktorTC\":\"" +
                item["doktorTC"] +
                "\",\"anabilim\":\"" +
                item["anabilim"] +
                "\"}";

            dynamic jsondoktor = json.decode(doktorlar);
            doktorlist.add(jsondoktor);
          }
          setState(() {
            doktorlistpage = doktorlist;
          });
          await getDoktorUzmanlik((tJson2) {
            for (var item2 in tJson2["messsage"]) {
              uzmanlik = "{\"uzmanlikID\":\"" +
                  item2["uzmanlikID"].toString() +
                  "\",\"uzmanlikAd\":\"" +
                  item2["uzmanlikAd"] +
                  "\",\"doktorID\":\"" +
                  item2["doktorID"].toString() +
                  "\"}";
              dynamic jsondoktor = json.decode(uzmanlik);
              uzmanliklist.add(jsondoktor);
            }
            setState(() {
              uzmanliklistpage = uzmanliklist;
            });
            Route route =
                MaterialPageRoute(builder: (_) => const PatientHomePage());
            Navigator.pushReplacement(context, route);
          }, (fJson2) {});
        }, (fJson) {});
      }
    }, (jsonFalse) {
      Fluttertoast.showToast(
          msg: 'hastaTc and hastaParola not valid?', textColor: Colors.red);
    });
  }
}
