import 'package:flutter/material.dart';
class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 250),
    width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(223, 228, 250, 1),
            Color.fromRGBO(241, 243, 255, 1),
            Color.fromRGBO(241, 243, 255, 1),

          ]
        ),
        borderRadius: BorderRadius.all(Radius.elliptical(30, 35)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffabb2ea),
            offset: Offset(4,4),
            spreadRadius: 1,
            blurRadius: 5,

          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: Offset(-5,-5),
            spreadRadius: 1,
            blurRadius: 5,

          ),
        ]
      ),
    );
  }
}
