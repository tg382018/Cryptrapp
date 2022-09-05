import 'package:cryptrapp/compontents/Appbar.dart';
import 'package:cryptrapp/compontents/Drawer.dart';
import 'package:cryptrapp/compontents/button.dart';
import 'package:cryptrapp/compontents/myCard.dart';
import 'package:cryptrapp/pages/item_detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
      body: GestureDetector(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5,),
            ListTile(
              title: Text("Hello Tahsin",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              subtitle: Padding(padding: EdgeInsets.only(top: 9),child: Text("Welcome Again",style: TextStyle(color: Colors.white,fontSize: 12),),),
            ),

            SizedBox(height: 15,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 55,),
                    MyCard(),
                    SizedBox(height: 35,),
                    MyCard(),
                    SizedBox(height: 35,),
                    MyCard(),

                  ],
                ),
              ],
            ),)

          ],
        ),
    onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetail()));
    },  ),
    );
  }
}
