// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';
import 'package:firebase_deneme/popupScreens/popup_ui.dart';
import 'package:firebase_deneme/rest/rest_api.dart';
import 'package:firebase_deneme/screens/patient/patient_doctor.dart';
import 'package:flutter/material.dart';
import '../../../color.dart';

List<dynamic> doktorlistpage = [];
List<dynamic> sabitdoktor = [];
List<dynamic> uzmanliklistpage = [];

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  _PatientHomePageState createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      sabitdoktor = doktorlistpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kLightPrimaryColor,
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupUi(),
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
                SizedBox(width: size.width * 0.15),
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
            SizedBox(
                width: 500,
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    if (value != "") {
                      List<dynamic> newlist = [];
                      List<dynamic> newlistdyn = [];
                      for (var item in sabitdoktor) {
                        if (item["doktorAd"]
                                .toString()
                                .toUpperCase()
                                .indexOf(value.toUpperCase()) >
                            -1) {
                          newlist.add(item);
                        }
                        if (item["anabilim"]
                                .toString()
                                .toUpperCase()
                                .indexOf(value.toUpperCase()) >
                            -1) {
                          newlist.add(item);
                        }
                        if (newlist.length > 0) {
                          newlistdyn.add(newlist[0]);
                        }
                        newlist.clear();
                      }
                      setState(() {
                        doktorlistpage = newlistdyn;
                      });
                    } else {
                      setState(() {
                        doktorlistpage = sabitdoktor;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'ARA',
                    icon: Icon(Icons.search, color: kSecondaryPrimaryColor),
                  ),
                )),
            SizedBox(height: size.height * 0.05),
            Text(
              "UZMANLIK ALANLARINA GÖRE DOKTORLAR",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Container(
                width: size.longestSide,
                height: size.height * 0.20,
                decoration: BoxDecoration(
                    color: kDividerColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doktorlistpage.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: CardDoctor(
                          doktorlistpage[i]["doktorAd"],
                          doktorlistpage[i]["anabilim"],
                          "assets/icons/profile.jpeg"),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Future<dynamic> _fetchNetworkCall() async {}

  Widget CardDoctor(
    String isim,
    String uzmanlik_alani,
    String image,
  ) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PatientDoctorHomePage();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              image,
              width: 25.0,
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isim,
                      style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  Text(uzmanlik_alani,
                      style: TextStyle(color: Colors.black, fontSize: 10.0))
                ],
              ),
            )
          ]),
        ));
  }
}
