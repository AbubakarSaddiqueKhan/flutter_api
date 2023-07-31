import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/albums/albums_api_service.dart';
import 'package:flutter_json_placeholder_api/albums/albums_data_model.dart';

class DisplayAlbumsScreen extends StatefulWidget {
  const DisplayAlbumsScreen({super.key});

  @override
  State<DisplayAlbumsScreen> createState() => _DisplayAlbumsScreenState();
}

class _DisplayAlbumsScreenState extends State<DisplayAlbumsScreen> {
  late List<AlbumsDataModel> albumsDataModelList = [];

  @override
  void initState() {
    super.initState();
    getAlbumsData();
  }

  void getAlbumsData() async {
    albumsDataModelList = (await AlbumsApiService().getAlbumsData())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Albums Data"),
          centerTitle: true,
        ),
        body: albumsDataModelList == null || albumsDataModelList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: albumsDataModelList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(" Id :  ${albumsDataModelList[index].id}"),
                      Text(" User Id  : ${albumsDataModelList[index].userId}"),
                      Text(" Title :  ${albumsDataModelList[index].title}")
                    ],
                  );
                },
              ));
  }
}
