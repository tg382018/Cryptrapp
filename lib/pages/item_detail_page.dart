
import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cryptrapp/compontents/Appbar.dart';
import 'package:cryptrapp/compontents/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';

import '../class/projects.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key,required this.item}) : super(key: key);
  final Projects item;
  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {

   bool visib1=true;
   bool visib2=true;
   bool visib3=true;
   bool visib4=true;

   QuillController _controller = QuillController.basic();


   void gelenikaydet(incomingJSONText)
   {
     var myJSON = jsonDecode(incomingJSONText);
     _controller = QuillController(
         document: Document.fromJson(myJSON),
         selection: TextSelection.collapsed(offset: 0));
   }

  @override
  void initState() {
    // TODO: implement initState
if(widget.item.proje_twitter=="-")
  {
    visib1=false;
  }

if(widget.item.proje_discord=="-")
{
  visib2=false;
}

if(widget.item.proje_telegram=="-")
{
  visib3=false;
}

if(widget.item.proje_linkedin=="-")
{
  visib4=false;
}
gelenikaydet(widget.item.proje_aciklama);
  }


  @override

  ScreenshotController sckon=ScreenshotController();
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
                        child: CircleAvatar(radius: 34,backgroundImage: NetworkImage(widget.item.proje_icon_url),),
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
              child: QuillEditor(
                focusNode: FocusNode(),
                padding: EdgeInsets.all(0),
                autoFocus: false,
                scrollable: true,
                showCursor: false,
                controller: _controller,
                readOnly: true,
                expands: false,
                scrollController: ScrollController(),
                // true for view only mode
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end
              ,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RaisedButton(color: Colors.deepOrangeAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [


                        Visibility( visible:visib1,
                          child: Row(
                            children: [
                              GestureDetector(onTap:()async{
                                var url = widget.item.proje_twitter;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },child: Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.twitter,color: Colors.white,),)),
                            ],
                          ),
                        ),



    Visibility(visible: visib2,
      child: Row(
        children: [
          GestureDetector(onTap:()async{
          var url = widget.item.proje_discord;
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }
          },child:
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.discord,color: Colors.white,),),
                                ],
                              ),),
        ],
      ),
    ),



    Visibility(visible: visib3,
      child: Row(
        children: [
          GestureDetector(onTap:()async{
          var url = widget.item.proje_telegram;
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }
          },child:
                            Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.telegram,color: Colors.white,),),),
        ],
      ),
    ),



    Visibility(visible: visib4,
      child: Row(
        children: [
          GestureDetector(onTap:()async{
          var url = widget.item.proje_linkedin;
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }
          },child:
                            Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),child: Icon(FontAwesomeIcons.linkedin,color: Colors.white,),),),
        ],
      ),
    ),


                    ],),
                  onPressed: ()
                   {},),
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




            FlatButton(color: Colors.deepOrangeAccent,onPressed: (){}, child: RichText(
    text: TextSpan(
    children: [
    TextSpan(
    style: TextStyle(color: Colors.black),
    text: ""
    ),
    TextSpan(
    style: TextStyle(color: Colors.white),
    text: "Web Site",
    recognizer: TapGestureRecognizer()..onTap =  () async{
    var url = widget.item.proje_website;
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


    );
  }

  Future<String> saveImage(Uint8List bytes) async
  {
    await[Permission.storage].request();
    final result=await ImageGallerySaver.saveImage(bytes);
    return result['filePath'];

  }

  Future saveAndShare(Uint8List bytes) async
  {
    final directory=await getApplicationDocumentsDirectory();
    final image=File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    final im='${widget.item.proje_adi} - See about more details on CryptrApp';
    await Share.shareFiles([image.path],text: im);
  }
}
