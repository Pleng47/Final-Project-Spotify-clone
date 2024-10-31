// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/album_card.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider image;
  const AlbumView({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override 
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
    ..addListener((){
      imageSize = initialSize - scrollController.offset;
      if(imageSize < 0){
        imageSize = 0;
      }
      containerHeight = containerinitalHeight - scrollController.offset;
      if(containerHeight < 0){
        containerHeight = 0;
      }
      imageOpacity = imageSize / initialSize;
      if (scrollController.offset > 224){
        showTopBar = true;
      } else{
        showTopBar = false;
      }
      
      print(scrollController.offset); 
      setState(() {});
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
       children: [
        Container(
          height: containerHeight,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: imageOpacity.clamp(0, 1.0),
                child: Container(
                 decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                   color: Colors.black.withOpacity(.5),
                   offset: Offset(0, 20),
                   blurRadius: 32,
                   spreadRadius: 16,
                   )
                  ],
                 ),
                 child: Image(
                   image: widget.image, 
                   width: imageSize,
                   height: imageSize,
                   fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(
              height: 100,
             ),
            ],

          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.none,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, 
                      end: Alignment.bottomCenter, 
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [ 
                      SizedBox(height: initialSize + 32),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The most popular songs from singers and artists around the world", 
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/logo.png"), 
                                  width: 32, 
                                  height: 32,
                                ),
                                SizedBox(width: 8),
                                Text("Spotify")
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              "1,168,090 likes 5h 3m", 
                            style: Theme.of(context).textTheme.bodySmall
                            ),
                            SizedBox(height: 16,),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite),
                                    SizedBox(width: 16,),
                                    Icon(Icons.more_horiz),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                   ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.black,
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Text(
                      "The most popular songs from singers and artists around the world"),
                      SizedBox(height: 32),
                    Text(
                        "You might also like", 
                        style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AlbumCard(
                            size: cardSize,
                            label: "Gamini-Fourth", 
                            image: AssetImage("assets/album5.jpg"), onTap: () {  },
                          ),
                          AlbumCard(
                            size: cardSize,
                            label: "No one else", 
                            image: AssetImage("assets/album2.jpg"), onTap: () {  },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AlbumCard(
                            size: cardSize,
                            label: "BodySlam", 
                            image: AssetImage("assets/album7.jpg"), onTap: () {  },
                          ),
                          AlbumCard(
                            size: cardSize,
                            label: "โกไข่-นายสน", 
                            image: AssetImage("assets/album10.jpg"), onTap: () {  },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AlbumCard(
                            size: cardSize,
                            label: "Mystery of Lukthung Love", 
                            image: AssetImage("assets/album12.jpg"), onTap: () {  },
                          ),
                          AlbumCard(
                            size: cardSize,
                            label: "In car", 
                            image: AssetImage("assets/album6.jpg"), onTap: () {  },
                          ),
                        ],
                      ),
                    ),
                  ],),
                )
              ],
            ),
          ),
        ),
        // App Bar
        Positioned(
          child: Container(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              color: showTopBar 
                 ? Color(0xFFC61855).withOpacity(1) 
                 : Color(0xFFC61855).withOpacity(0), 
              padding: EdgeInsets.symmetric(
                horizontal: 16, 
                vertical: 8,
              ),
              child: SafeArea(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                           Icons.keyboard_arrow_left, 
                           size: 38,
                          ),  
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 250),
                        opacity: showTopBar ? 1 : 0,
                        // child: Text(
                        //   "Die with a smile", 
                        //   style: Theme.of(context).textTheme.titleLarge,
                        // ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 
                          80 - containerHeight.clamp(120.0, double.infinity),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff14D860),
                              ),
                              child: Icon(
                                Icons.play_arrow, 
                                size: 38,
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                                child: Icon(
                                  Icons.shuffle,
                                  color: Colors.black,
                                  size: 14, 
                       ),
                      )
                     ],
                    ),
                   )
                  ],
                 ),
                ),
              ),
            ),
       ))
      ],
     ),
    );
  }
}

