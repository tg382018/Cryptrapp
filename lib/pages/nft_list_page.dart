import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../class/projects.dart';
import '../compontents/Appbar.dart';
import '../compontents/Drawer.dart';
import '../compontents/myCard.dart';
import '../cubit/projects_cubit.dart';

class NftListPage extends StatefulWidget {
  const NftListPage({Key? key}) : super(key: key);

  @override
  State<NftListPage> createState() => _NftListPageState();
}

class _NftListPageState extends State<NftListPage> {
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

          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(width:322,height:MediaQuery.of(context).size.height /1.4,
                      child: BlocBuilder<ProjectsCubit,List<Projects>>(builder:
                          (context,liste)
                      {
                        if(liste.isNotEmpty)
                        {
                          return ListView.builder(itemBuilder: (context,index){
                            var proje=liste[index];
                            if(proje.proje_turu=="NFT")
                            {
                              return MyCard(item: proje);
                            }
                            else
                            {
                              return Container(child: Column(
                                children: [
                                  Text(proje.proje_adi,style: TextStyle(color: Colors.white),),
                                  Text(proje.proje_no.toString(),style: TextStyle(color: Colors.white),),
                                  Text(proje.proje_turu,style: TextStyle(color: Colors.white),),
                                  Text(proje.proje_resim_url,style: TextStyle(color: Colors.white),),

                                ],
                              ),);
                            }
                          },itemCount: liste.length,);
                        }
                        else
                        {
                          return Container(child: Text("aa",style: TextStyle(color: Colors.white),));
                        }
                      }

                      ),
                    ),
                  ],
                ),
              ],
            ),)

        ],
      ),

    );
  }
}
