import 'package:flutter/material.dart';

import '../../color.dart';
import 'login.dart';

class KayitOl extends StatelessWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: const Text('Bilgilerinizin Doğruluğuna Emin Misiniz?'),
        actions: <Widget>[
          MaterialButton(
            shape: const StadiumBorder(),
            minWidth: 100,
            color: kDarkPrimaryColor,
            child: const Text("Hayır"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: MaterialButton(
              shape: const StadiumBorder(),
              minWidth: 100,
              color: kLightPrimaryColor,
              child: const Text("Evet"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
