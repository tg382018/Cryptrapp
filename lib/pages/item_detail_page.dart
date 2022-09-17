import 'package:cryptrapp/compontents/Appbar.dart';
import 'package:cryptrapp/compontents/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import '../class/projects.dart';
import '../compontents/myCard.dart';
class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key,required this.item}) : super(key: key);
  final Projects item;
  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override


  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: DrawerMy(),
      backgroundColor: Colors.black,

      appBar:PreferredSize(

        preferredSize: Size.fromHeight(70),
        child: SafeArea(

          child: Appbar(

            left: Icon(Icons.list_outlined,color: Colors.white,),

          ),
        ),),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(

                  width: MediaQuery.of(context).size.width/1.25,
                  height: MediaQuery.of(context).size.height/8,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: CircleAvatar(radius: 34,backgroundImage: AssetImage(widget.item.proje_icon_url),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.item.proje_adi,style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                                Text(widget.item.proje_turu,style: TextStyle(color: Colors.white,fontSize: 13,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
            Container(width: 422,height: 131,
              child: Image.network(
              widget.item.proje_resim_url

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [Text(widget.item.proje_aciklama
                ,style: TextStyle(color: Colors.white),)],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end
              ,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.twitter,color: Colors.white,),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.discord,color: Colors.white,),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.telegram,color: Colors.white,),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.linkedin,color: Colors.white,),),
                  ],),
                ),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(width: 145,height: 44
                      
                      ,child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 113,height: 33,child: Column(
                            children: [
                              Text("FUNDRAISING",style: const TextStyle(color: Colors.white),),
                              Text(widget.item.proje_fon,style: const TextStyle(color: Colors.green),),
                            ],
                          )),
                        ],
                      ),decoration: BoxDecoration(border:
                    Border.all(width: 3,color: Colors.deepOrangeAccent),borderRadius: BorderRadius.all(Radius.circular(5)
                    )
                    )
                    ,),
                ),
              ],
            ),
            FlatButton(color: Colors.deepOrangeAccent,onPressed: (){}, child: Text("Website",style: const TextStyle(color: Colors.white),),
            ),

          ],

        ),


    );
  }
}
