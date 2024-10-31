
import 'package:flutter/material.dart';
import 'package:spotify_clone/views/album_view.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final VoidCallback onTap;
  final double size;// Change Function to VoidCallback

  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    this.size = 120,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image, 
            width: 140, 
            height: 140, 
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}