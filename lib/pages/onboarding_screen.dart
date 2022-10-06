import 'package:cryptrapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cryptrapp/utilities/styles.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {




var kon=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
     children: [
       Padding(
         padding: EdgeInsets.symmetric(vertical: 40.0),
         child: Padding(
           padding: EdgeInsets.all(40.0),

             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Center(
                     child: Column(
                       children: [
                         Image(
                           image: AssetImage(
                             'assets/images/onboarding0.png',
                           ),
                           height: 150.0,
                           width: 150.0,
                         ),
                         Text(
                           'Reach The New Web3 Projects \nIncrease your earnings with early research',
                           style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: 15.0),
                         Text(
                           'In our application, we share the new Crypto, NFT projects with all the details.',
                           style: kSubtitleStyle,
                         ),
                         TextField(controller: kon,style: TextStyle(color: Colors.white),autofocus: true,decoration: InputDecoration(focusColor: Colors.white,hintText: "İsminizi giriniz",hintStyle: TextStyle(color: Colors.white))),
                         Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                           RaisedButton(onPressed: () async{
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                                  final prefs= await SharedPreferences.getInstance();
                                  prefs.setBool('showHome', true);
                                  prefs.setString('titlem', kon.text);

                           },child: Text("Next"),)
                         ],),
                       ],
                     ),

                   ),


                 ],
               ),
             ),

         ),
       ),
     ],
      ),

    );
  }
}
