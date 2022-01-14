import 'package:firebase_deneme/screens/patient/patient_doctor_chat.dart';
import 'package:flutter/material.dart';

import '../../color.dart';

class PatientDoctorHomePage extends StatefulWidget {
  const PatientDoctorHomePage({Key? key}) : super(key: key);

  @override
  _PatientDoctorHomePageState createState() => _PatientDoctorHomePageState();
}

class _PatientDoctorHomePageState extends State<PatientDoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kLightPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment
                  .center, //Icons.person ? image seçilmediyse: image seçildiyse
              children: [
                Image.asset(
                  "assets/icons/profile.jpeg",
                  width: size.width * 0.15,
                ),
                SizedBox(width: size.width * 0.1),
                Column(
                  children: [
                    const Text('DOKTOR AD-SOYAD',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(height: size.height * 0.02),
                    const Text('Doktorun Uzmanlık Alanı',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ]),
          SizedBox(height: size.height * 0.06),
          Container(
            width: size.longestSide,
            height: size.height * 0.40,
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: kDividerColor,
              borderRadius: BorderRadius.circular(20.0),
              //topLeft: Radius.circular(30.0),
              //topRight: Radius.circular(30.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("DOKTORUN PROFİL DETAYLARI/ BİLGİLERİ",
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: 100,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: kLightPrimaryColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PatientDoctorChatHomePage()),
                  );
                },
                child: const Text('MESAJ',
                    style: TextStyle(color: Colors.black, fontSize: 25.0))),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
