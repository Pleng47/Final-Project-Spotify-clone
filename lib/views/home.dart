import 'package:spotify_clone/widgets/album_card.dart';
import 'package:spotify_clone/widgets/song_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
            color: Color.fromARGB(186, 2, 124, 49),
         ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
              colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(.9), 
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(1),
            ],
          ),
         ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recently Played", style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          Icon(Icons.history),
                          SizedBox(width: 16),
                          Icon(Icons.settings),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      AlbumCard(
                        label: "Pop Mix", 
                        image: AssetImage("assets/album1.jpg"), onTap: () {  },
                      ),
                      SizedBox(width: 16),
                      AlbumCard(
                        label: "Chill Mix", 
                        image: AssetImage("assets/album2.jpg"), onTap: () {  },
                      ),
                      SizedBox(width: 16),
                      AlbumCard(
                        label: "Top 50-Thailand", 
                        image: AssetImage("assets/top50.jpg"), onTap: () {  },
                      ),
                      SizedBox(width: 16),
                      AlbumCard(
                        label: "2010s Mix", 
                        image: AssetImage("assets/album4.jpg"), onTap: () {  },
                      ),
                      SizedBox(width: 16),
                      AlbumCard(
                        label: "Thai Mix", 
                        image: AssetImage("assets/album5.jpg"), onTap: () {  },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Good evening", 
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RowAlbumCard(
                            label:  "Top 50 - Thailand",
                            image: AssetImage("assets/top50.jpg"),
                          ),
                          SizedBox(width: 16),
                           RowAlbumCard(
                            label:  "Top 50 - Bangkok",
                            image: AssetImage("assets/album7.jpg"),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RowAlbumCard(
                            label:  "Bodyslam",
                            image: AssetImage("assets/album8.jpg"),
                          ),
                          SizedBox(width: 16),
                           RowAlbumCard(
                            label:  "Best Hip-Hop",
                            image: AssetImage("assets/album9.jpg"),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RowAlbumCard(
                            label:  "Southern Thailand",
                            image: AssetImage("assets/album10.jpg"),
                          ),
                          SizedBox(width: 16),
                           RowAlbumCard(
                            label:  "RS",
                            image: AssetImage("assets/album11.jpg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          "Recents", 
                          style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(children: [
                        SongCard(
                          image: AssetImage("assets/album5.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album7.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album9.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album11.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album3.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album1.jpg"),
                        ),
                      ],
                     ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          "Recommended Stations", 
                          style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(children: [
                        SongCard(
                          image: AssetImage("assets/album2.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album4.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album6.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album8.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album10.jpg"),
                        ),
                        SizedBox(width: 16),
                        SongCard(
                          image: AssetImage("assets/album12.jpg"),
                        ),
                      ],
                     ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
              ],
             ),
            ),
          ),
        ),
      ],
     ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;

  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(children: [
          Image(
            image: image,
            height: 48, 
            width: 48, 
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8),
          Text(label)
        ],),
      ),
    );
  }
}
