import 'dart:convert';
import 'package:cryptrapp/repo/projects_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  QuillController _controller = QuillController.basic();
  var frtool=ProjectsRepo();
  bool switchim = false;
  var k1=TextEditingController();
  var k2=TextEditingController();
  var k3=TextEditingController();
  var k4=TextEditingController();
  var k5=TextEditingController();
  var k6=TextEditingController();
  var k7=TextEditingController();
  var k8=TextEditingController();
  var k9=TextEditingController();
  var k10=TextEditingController();
  var k11=TextEditingController();
  var k12=TextEditingController();
  var k13=TextEditingController();
  var k14=TextEditingController();
  var jsonm;




  void jsn()
  {

    jsonm = jsonEncode(_controller.document.toDelta().toJson());
    print(json);
  }

  @override
  void initState() {
    // TODO: implement initState
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Padding(padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller:k1,decoration: InputDecoration(hintText: "Proje no girin"),),
          TextField(controller:k2,decoration: InputDecoration(hintText: "Proje adı girin"),),
          TextField(controller:k3,decoration: InputDecoration(hintText: "Proje turu girin (NFT or Crypto)"),),
    TextField(controller:k4,decoration: InputDecoration(hintText: "Proje ağ girin"),),
              Container(width:511,height:311,child: Column(

                children: [
                  QuillToolbar.basic(controller: _controller),
                  Container(width: 411,height: 155,
                    child: Expanded(
                      child: Container(
                        child: QuillEditor.basic(
                          controller: _controller,
                          readOnly: false, // true for view only mode
                        ),
                      ),
                    ),
                  ),


                ],

              ),
              ),
    TextField(controller:k6,decoration: InputDecoration(hintText: "Proje fon girin"),),
    TextField(controller:k7,decoration: InputDecoration(hintText: "Proje twitter"),),
    TextField(controller:k8,decoration: InputDecoration(hintText: "Proje discord"),),
    TextField(controller:k9,decoration: InputDecoration(hintText: "Proje linkedin"),),
    TextField(controller:k10,decoration: InputDecoration(hintText: "Proje telegram"),),
    TextField(controller:k11,decoration: InputDecoration(hintText: "Proje network (Gamefi,blockchain)"),),
    TextField(controller:k12,decoration: InputDecoration(hintText: "Proje icon"),),
    TextField(controller:k13,decoration: InputDecoration(hintText: "Proje resim"),),
              TextField(controller:k14,decoration: InputDecoration(hintText: "Proje website"),),
    Row(children: [
          Text("Öne Çıkarılanlara Eklensin mi ?"),
          Switch(
            value: switchim,
            onChanged: (context) {
              setState(() {
                switchim = context;
              });
            },
          )
    ]),
    RaisedButton(onPressed: (){
      jsn();
      String c = jsonm;
          frtool.addProjects(int.parse(k1.text), k2.text, k3.text, k4.text, c, k6.text, k7.text, k8.text, k9.text, k10.text, k11.text, k12.text, k13.text,k14.text, switchim);
    },child:Text("Ekle")),


            ],
          ),
        ),
      ),
    ),);
  }
}
