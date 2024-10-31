import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();
  String searchText = '';

  // หมวดหมู่เพลงและภาพประกอบ
  final List<Map<String, String>> genres = [
    {'title': 'thai pop', 'imagePath': 'assets/thai_pop.jpg'},
    {'title': 'hypertechno', 'imagePath': 'assets/hypertechno.jpg'},
    {'title': 'delulu', 'imagePath': 'assets/delulu.jpg'},
    {'title': 'Music', 'imagePath': 'assets/music.jpg'},
    {'title': 'Podcasts', 'imagePath': 'assets/podcasts.jpg'},
    {'title': 'Live Events', 'imagePath': 'assets/live_events.jpg'},
    {'title': 'Made For You', 'imagePath': 'assets/made_for_you.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              // เพิ่มฟังก์ชันการใช้กล้องที่นี่
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'What do you want to listen to?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Explore your genres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: genres
                    .where((genre) =>
                        genre['title']!.toLowerCase().contains(searchText))
                    .map((genre) {
                  return GenreCard(
                    title: genre['title']!,
                    imagePath: genre['imagePath']!,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  final String title;
  final String imagePath;

  GenreCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}