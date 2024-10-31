import 'package:flutter/material.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  _LibraryViewState createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  final List<Map<String, String>> _artists = [
    {'name': 'Hailee Steinfeld', 'image': 'assets/hailee.jpg'},
    {'name': 'สครับบ', 'image': 'assets/scrubb.jpg'},
    {'name': 'The Script', 'image': 'assets/the_script.jpg'},
    {'name': 'Ed Sheeran', 'image': 'assets/ed_sheeran.jpg'},
    {'name': 'Sam Smith', 'image': 'assets/sam.jpg'},
    {'name': 'Maroon 5', 'image': 'assets/maroon5.jpg'},
    {'name': 'Justin Bieber', 'image': 'assets/justin.jpg'},
    {'name': 'Bruno Mars', 'image': 'assets/bruno.jpg'},
    {'name': 'Billkin', 'image': 'assets/bk.jpg'},
    {'name': 'PiXXiE', 'image': 'assets/px.jpg'},
    {'name': 'Saran', 'image': 'assets/sr.jpg'},
    {'name': 'Taylor Swift', 'image': 'assets/ts.jpg'},
    {'name': 'Central Cee', 'image': 'assets/cc.jpg'},
    {'name': 'Illslick', 'image': 'assets/ill.jpg'},
    {'name': 'Sabrina Carpenter', 'image': 'assets/sc.jpg'},
    {'name': 'Gigi Perez', 'image': 'assets/gg.jpg'},
    {'name': 'Doja Cat', 'image': 'assets/dj.jpg'},
  ];

  List<Map<String, String>> _filteredArtists = [];

  @override
  void initState() {
    super.initState();
    _filteredArtists = _artists;
  }

  void _filterArtists(String query) {
    setState(() {
      _filteredArtists = _artists
          .where((artist) => artist['name']!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showAddArtistDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController imageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Favorite Artist'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Artist Name'),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(hintText: 'Favorite song'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (nameController.text.isNotEmpty && imageController.text.isNotEmpty) {
                  setState(() {
                    _artists.add({
                      'name': nameController.text,
                      'image': imageController.text,
                    });
                    _filteredArtists = _artists; // อัพเดตรายการที่กรองเพื่อแสดงผลใหม่
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Library'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddArtistDialog, // เรียกใช้ฟังก์ชันเพิ่มศิลปิน
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: 'Search Artists',
                filled: true,
                fillColor: Colors.grey[800],
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (query) {
                _filterArtists(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredArtists.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_filteredArtists[index]['image']!),
                  ),
                  title: Text(
                    _filteredArtists[index]['name']!,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LibraryView(),
    theme: ThemeData.dark(),
  ));
}
