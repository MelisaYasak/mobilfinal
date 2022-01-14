import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget child;
  const WelcomeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -60,
              right: 0,
              child: Image.asset(
                "assets/images/welcome_screen_top.png",
              ),
            ),
            Positioned(
                bottom: 0,
                child: Image.asset("assets/images/welcome_screen_bottom.png")),
            child,
          ],
        ));
  }
}
