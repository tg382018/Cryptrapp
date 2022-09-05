import 'package:cryptrapp/compontents/Appbar.dart';
import 'package:cryptrapp/compontents/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../compontents/myCard.dart';
class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://youtu.be/YM9x0HWXV3c',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }


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
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: CircleAvatar(radius: 34,backgroundImage: AssetImage("assets/images/FBmFxp78_400x400.jpg"),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("CASTAWAYS",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                          Text("GameFi Project",style: TextStyle(color: Colors.white,fontSize: 13,),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return Container(width: 222,height: 222,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],

        ),

    );
  }
}
