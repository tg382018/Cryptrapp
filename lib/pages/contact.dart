import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../class/projects.dart';
import '../compontents/Appbar.dart';
import '../compontents/Drawer.dart';
import '../compontents/myCard.dart';
import '../cubit/projects_cubit.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMy(),
      backgroundColor: Colors.black,

      appBar:PreferredSize(

        preferredSize: Size.fromHeight(70),
        child: SafeArea(

          child: Appbar(

            left: Icon(Icons.list_outlined,color: Colors.white,),

          ),
        ),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            FlatButton(color: Colors.deepOrangeAccent,onPressed: (){}, child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: ""
                      ),
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text: "Send Email Us",
                          recognizer: TapGestureRecognizer()..onTap =  () async{
                            var url = "mailto:tgulck@gmail.com";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                      ),
                    ]
                )),),

          ],
        ),
      ),

    );
  }
}
