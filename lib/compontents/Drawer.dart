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
              buildMenuItem(text: "New Crypto Projects",icon: Icons.home),
              buildMenuItem(text: "New NFT Projects",icon: Icons.home),
              buildMenuItem(text: "About Us",icon: Icons.home),
              buildMenuItem(text: "Contact",icon: Icons.home),


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
     onTap: (){},

    );
  }
}
