import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../color.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            IconButton(
              iconSize: 130,
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kLightPrimaryColor),
                padding: const EdgeInsets.all(15.0),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'İSİM-SOYİSİM',
                    icon: Icon(Icons.short_text),
                    border: OutlineInputBorder(),
                  ),
                )),
            SizedBox(height: size.height * 0.05),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kLightPrimaryColor),
              padding: const EdgeInsets.all(15.0),
              child: const TextField(
                decoration: InputDecoration(
                    labelText: 'AÇIKLAMA',
                    icon: Icon(Icons.text_snippet),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kDarkPrimaryColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('KAYDET',
                        style: TextStyle(color: Colors.white, fontSize: 25.0))),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: kLightPrimaryColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('İPTAL',
                        style: TextStyle(color: Colors.black, fontSize: 25.0))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
