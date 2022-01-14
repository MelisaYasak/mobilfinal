// ignore_for_file: non_constant_identifier_names

import 'package:firebase_deneme/popupScreens/popup_ui.dart';
import 'package:flutter/material.dart';

import '../../color.dart';
import 'doctor_patient_chat.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightPrimaryColor,
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme().apply(bodyColor: Colors.white),
            ),
            child: const PopupUi(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: Image.asset("assets/icons/profile.jpeg"),
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  children: const [
                    Text('Merhaba AD-SOYAD',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              'Doktorun açıklaması',
              style: TextStyle(fontSize: 25.0),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: size.longestSide,
              height: size.height * 0.65,
              padding: EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: kDividerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                  CardDoctor("Mesaj 1", "Son mesajın ilk 50 karakteri",
                      "assets/icons/profile.jpeg"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CardDoctor(
    String isim,
    String uzmanlikAlani,
    String image,
  ) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DoctorPatientPage();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              image,
              width: 25.0,
              height: 25.0,
            ),
            const SizedBox(width: 15.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isim,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold)),
                  Text(uzmanlikAlani,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 10.0))
                ],
              ),
            ),
            const SizedBox(width: 90.0),
            const Text("11:42"),
          ]),
        ));
  }
}
