import 'package:flutter/material.dart';

class DoctorLoginImageAnimation extends StatefulWidget {
  const DoctorLoginImageAnimation({Key? key}) : super(key: key);

  @override
  _DoctorLoginImageAnimationState createState() =>
      _DoctorLoginImageAnimationState();
}

class _DoctorLoginImageAnimationState extends State<DoctorLoginImageAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(2, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/icons/heart.png'),
      ),
    );
  }
}
