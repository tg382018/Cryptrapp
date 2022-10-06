

import 'package:cryptrapp/pages/admin_page.dart';
import 'package:flutter/material.dart';

Widget Appbar({required Widget left})
{
  return Container(

    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 11),
      child: Row(

        children: [
          Builder(
            builder: (context) => IconButton(
              icon: left,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          SizedBox(width: 111,),
          Text("CryptrApp",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),

        ],
      ),
    ),
  );
}