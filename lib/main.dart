import 'package:cryptrapp/class/projects.dart';
import 'package:cryptrapp/compontents/Appbar.dart';
import 'package:cryptrapp/compontents/Drawer.dart';
import 'package:cryptrapp/compontents/button.dart';
import 'package:cryptrapp/compontents/myCard.dart';
import 'package:cryptrapp/cubit/projects_cubit.dart';
import 'package:cryptrapp/pages/item_detail_page.dart';
import 'package:cryptrapp/repo/projects_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDD6y476aW-d4E56WCoTnFtxkyQBFBFJhc",
        appId: "1:870612418439:android:0b85d2c18af18513c81d22",
        messagingSenderId: "870612418439",
        projectId: "cryptrapp",
        storageBucket: "cryptrapp.appspot.com"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
    BlocProvider(create: (context) => ProjectsCubit())] ,

        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var prorepo=ProjectsRepo();

@override
  void initState() {
    // TODO: implement initState
  context.read<ProjectsCubit>().getProjeler();
  }

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

                  Container(width:MediaQuery.of(context).size.width /1.13,height: MediaQuery.of(context).size.height /1.4,
                    child: BlocBuilder<ProjectsCubit,List<Projects>>(builder:
                    (context,liste)
                        {
                          if(liste.isNotEmpty)
                            {
                              return ListView.builder(itemBuilder: (context,index){
                                var proje=liste[index];
                                if(proje.proje_onecikarilan==true)
                                  {

                                  return MyCard(item: proje);
                                  }
                                else
                                  {
                                    return Container();
                                  }
                              },itemCount: liste.length,);
                            }
                          else
                            {
                              return Container();
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
