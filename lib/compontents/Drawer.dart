import 'package:cryptrapp/main.dart';
import 'package:cryptrapp/pages/about_page.dart';
import 'package:cryptrapp/pages/crypto_list_page.dart';
import 'package:cryptrapp/pages/nft_list_page.dart';
import 'package:flutter/material.dart';

class DrawerMy extends StatefulWidget {
  const DrawerMy({Key? key}) : super(key: key);

  @override
  State<DrawerMy> createState() => _DrawerMyState();
}

class _DrawerMyState extends State<DrawerMy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 242,

      child: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              SizedBox(height: 48,),
              buildMenuItem(text: "Home Page",icon: Icons.home),
              buildMenuItem(text: "New Crypto Projects",icon: Icons.account_tree_rounded),
              buildMenuItem(text: "New NFT Projects",icon: Icons.image_sharp),
              buildMenuItem(text: "About Us",icon: Icons.contact_support_rounded),
              buildMenuItem(text: "Contact",icon: Icons.mail),


            ],
          ),
        ),
      ),
    );

  }

  Widget buildMenuItem({required String text,required IconData icon})
  {
    final color=Colors.white;

    return ListTile(
leading: Icon(icon,color: color,),
      title: Text(text,style: TextStyle(color: color),),
      hoverColor: Colors.blue,
     onTap: (){
        if(text=="New NFT Projects")
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NftListPage()));
          }
        if(text=="New Crypto Projects")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CryptoListPage()));
        }
        if(text=="About Us")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
        }
        if(text=="Contact")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NftListPage()));
        }
        if(text=="Home Page")
        {
          Navigator.of(
              context)
              .pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                    MyHomePage(title: "title")),
                  (Route<dynamic> route) =>
              false);
        }
     },

    );
  }
}
