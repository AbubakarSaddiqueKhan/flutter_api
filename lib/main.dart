import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/albums/albums_data_model.dart';
import 'package:flutter_json_placeholder_api/albums/display_albums_screen.dart';
import 'package:flutter_json_placeholder_api/comments/display_comment_screen.dart';
import 'package:flutter_json_placeholder_api/general/api_provider.dart';
import 'package:flutter_json_placeholder_api/photos/display_photos_screen.dart';
import 'package:flutter_json_placeholder_api/posts/display_posts_screen.dart';
import 'package:flutter_json_placeholder_api/todos/display_todos_screen.dart';
import 'package:flutter_json_placeholder_api/users/display_users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<AlbumsDataModel>>? futureAlbums;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    AlbumApiProvider apiProvider = AlbumApiProvider();
    futureAlbums = apiProvider.fetchAlbumsData();
  }

  @override
  Widget build(BuildContext context) {
    return
        // DisplayAlbumsScreen();
        Scaffold(
      appBar: AppBar(
        title: Text("Display General Data"),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text('Click button to load data');
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  AlbumsDataModel albumsDataModel = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(albumsDataModel.id.toString()),
                    ),
                    title: Text(albumsDataModel.title),
                    trailing: CircleAvatar(
                      child: Text(albumsDataModel.userId.toString()),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Something went wrong"),
              );
            }
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AlbumApiProvider apiProvider = AlbumApiProvider();
          setState(() {
            futureAlbums = apiProvider.fetchAlbumsData();
          });
        },
        child: Icon(Icons.get_app_outlined),
      ),
    );
  }
}
