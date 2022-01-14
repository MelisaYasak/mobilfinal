import 'package:flutter/material.dart';

class KayitOlGirisYapBackground extends StatelessWidget {
  final Widget child;
  const KayitOlGirisYapBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/kayit_giris_top.png",
              ),
            ),
            Positioned(
                bottom: -75,
                right: -50,
                child: Image.asset(
                  "assets/images/kayit_giris_bottomleft.png",
                )),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/kayit_giris_bottom_right.png",
              ),
            ),
            child,
          ],
        ));
  }
}
