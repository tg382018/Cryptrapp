import 'package:flutter/material.dart';

import '../compontents/Appbar.dart';
import '../compontents/Drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
      body: Column(
        children: <Widget>[
          SizedBox(height: 15,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                      Image.asset("assets/images/av.png"),
                      Container(
                          width: 322,
                          height: 242,
                          child: Text("Hello I'm Truva. I'm 23 years old and I'm studying com"
                              "puter engineering.(will finish this year).I have been int"
                              "erested in crypto since 2015. I have researched "
                              "thou"
                              "sands of projects and joined thousands"
                              " of communities. I am knowledgeable in technic"
                              "al analysis, fundamental analysis, web3, bloc"
                              "kchain.I have also been working as a Communi"
                              "ty Manager/Moderator in crypto communities fo"
                              "r the last 2 years. I serve for the growth "
                              "of communities on community platforms su"
                              "ch as Discord, telegram.\n \nMy Twitter: twitter.com/truvakripto \nTelegram: @truva0 \nDiscord: TRUVA#6984",style:
                            TextStyle(color: Colors.white,),textAlign: TextAlign.center,)
                      ,),
            ],
          )

        ],
      ),

    );
  }
}
