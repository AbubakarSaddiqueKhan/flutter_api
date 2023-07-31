import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/ApiProvider.dart';
import 'package:flutter_json_placeholder_api/ModelClass.dart';

class FetchAlbum extends StatefulWidget {
  const FetchAlbum({super.key});

  @override
  State<FetchAlbum> createState() => _FetchAlbumState();
}

class _FetchAlbumState extends State<FetchAlbum> {
  Future<List<ApiAlbum>>? apiAlbum;
  Future<List<ModelClass>>? modelClass;
  ApiAlbum apiAlbums = ApiAlbum();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ModelClass>>(
        future: apiAlbums.fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ModelClass modelClass = snapshot.data![index];

                return ListTile(
                  leading: Text(modelClass.id.toString()),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
