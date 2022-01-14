import 'package:flutter/material.dart';
import '../../color.dart';

class DoctorPatientPage extends StatefulWidget {
  const DoctorPatientPage({Key? key}) : super(key: key);

  @override
  _DoctorPatientPage createState() => _DoctorPatientPage();
}

class _DoctorPatientPage extends State<DoctorPatientPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kLightPrimaryColor,
        title: const ListTile(
          title: Text(
            'AD-SOYAD',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Online',
            style: TextStyle(
              color: Colors.cyan,
            ),
          ),
          trailing: CircleAvatar(
            backgroundImage: AssetImage('assets/images/var.png'),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: kLightPrimaryColor,
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                      onPressed: () {
                        _ekler();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: kDarkPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      backgroundColor: kDarkPrimaryColor),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Mesajınızı yazın...",
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: kDarkPrimaryColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //MESAJLARDA EK GÖNDERİLEBİLMESİ İÇİN
  Widget _ekler() {
    return Row(
      children: [
        IconButton(
            onPressed: () {}, icon: Image.asset("assets/icons/picture.png")),
        IconButton(onPressed: () {}, icon: Image.asset("assets/icons/pdf.png")),
      ],
    );
  }
}
