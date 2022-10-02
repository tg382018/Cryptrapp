
import 'package:cloud_firestore/cloud_firestore.dart';
import '../class/projects.dart';
import 'dart:collection';

class ProjectsRepo
{
  Future<List<Projects>> getProjects() async
  {


    final querysnapshot=await FirebaseFirestore.instance.collection("crypto").get();
    List<QueryDocumentSnapshot> docs=querysnapshot.docs;
    final list=docs.map((doc) => Projects.fromJson(doc.data() as dynamic)).toList();


    //Sorting
 /*   for(int j=0;j<list.length-1;j++)
    {
      for(int i=0;i<list.length-1;i++)
      {
        if(list[i].proje_no>list[i+1].proje_no)
        {
          Projects gecici=list[i];
          list[i]=list[i+1];
          list[i+1]=gecici;
        }
      }}*/

    return list;
  }


Future<void> addProjects(
  int proje_no,
  String proje_adi,
  String proje_turu,
  String proje_ag,
  String proje_aciklama,
  String proje_fon,
  String proje_twitter,
  String proje_discord,
  String proje_telegram,
  String proje_linkedin,
  String proje_network,
  String proje_icon_url,
  String proje_resim_url,
    String proje_website,
    bool proje_onecikarilan,
    ) async
{
  final docUser=FirebaseFirestore.instance.collection('crypto').doc();
  var bilgi=HashMap<String,dynamic>();
  bilgi["id"]=docUser.id;
  bilgi["proje_no"]=proje_no;
  bilgi["proje_adi"]=proje_adi;
  bilgi["proje_turu"]=proje_turu;
  bilgi["proje_ag"]=proje_ag;
  bilgi["proje_aciklama"]=proje_aciklama;
  bilgi["proje_fon"]=proje_fon;
  bilgi["proje_twitter"]=proje_twitter;
  bilgi["proje_discord"]=proje_discord;
  bilgi["proje_telegram"]=proje_telegram;
  bilgi["proje_linkedin"]=proje_linkedin;
  bilgi["proje_network"]=proje_network;
  bilgi["proje_icon_url"]=proje_icon_url;
  bilgi["proje_resim_url"]=proje_resim_url;
  bilgi["proje_website"]=proje_website;
  bilgi["proje_onecikarilan"]=proje_onecikarilan;
  await docUser.set(bilgi);
}
}