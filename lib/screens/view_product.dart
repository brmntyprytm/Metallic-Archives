import 'package:flutter/material.dart';
import 'package:metallicarchives/widgets/left_drawer.dart';
import 'package:metallicarchives/screens/shoplist_form.dart';
import 'package:metallicarchives/models/Albums.dart';

class ViewAlbums extends StatefulWidget {
  const ViewAlbums({Key? key}) : super(key: key);

  @override
  State<ViewAlbums> createState() => _ViewAlbumsState();
}

class _ViewAlbumsState extends State<ViewAlbums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Albums',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: (() {
        if (albums.isEmpty) {
          return const Center(
            child: Text("No Albums found!"),
          );
        } else {
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Handle card tap
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(albums[index].name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      const SizedBox(height: 10),
                      Text('Description: ${albums[index].description}'),
                      const SizedBox(height: 10),
                      Text('Price: ${albums[index].price}'),
                    ],
                  ),
                ),
              );
            },
          );
        }
      })(),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()));
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black, // Set your desired button color
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}

List<Album> albums = [];
