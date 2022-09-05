import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: 320,
      height: 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Container(
                  child: Text(
                    "CASTAWAYS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: 43,
                  height: 43,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage:
                        AssetImage("assets/images/FBmFxp78_400x400.jpg"),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffabb2ea),
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "Game",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Row(
                  children: [
                    Text(
                      "Status: ",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "UPCOMING",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff4b5162),
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(223, 228, 250, 1),
                Color.fromRGBO(241, 243, 255, 1),
                Color.fromRGBO(241, 243, 255, 1),
              ]),
          borderRadius: BorderRadius.all(Radius.elliptical(30, 35)),
          boxShadow: [
            BoxShadow(
              color: Color(0xffabb2ea),
              offset: Offset(4, 4),
              spreadRadius: 1,
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              offset: Offset(-10, -10),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ]),
    );
  }
}
