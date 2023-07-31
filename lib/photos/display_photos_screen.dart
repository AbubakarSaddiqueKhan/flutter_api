import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/photos/photos_api_service.dart';
import 'package:flutter_json_placeholder_api/photos/photos_data_model.dart';

class DisplayPhotosScreen extends StatefulWidget {
  const DisplayPhotosScreen({super.key});

  @override
  State<DisplayPhotosScreen> createState() => _DisplayPhotosScreenState();
}

class _DisplayPhotosScreenState extends State<DisplayPhotosScreen> {
  late List<PhotosDataModel>? photosDataModelList = [];
  @override
  void initState() {
    super.initState();
    getPhotosData();
  }

  void getPhotosData() async {
    photosDataModelList = (await PhotosApiService().getPhotoData());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photos Data"),
          centerTitle: true,
        ),
        body: photosDataModelList == null || photosDataModelList!.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: photosDataModelList!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(" ID :  ${photosDataModelList![index].id}"),
                      Text(" Album Id ${photosDataModelList![index].albumId}"),
                      Text(
                          "  Thumbnail Url ${photosDataModelList![index].thumbnailUrl}"),
                      Text("  Title ${photosDataModelList![index].title}"),
                      Text(" Url :  ${photosDataModelList![index].url}")
                    ],
                  );
                },
              ));
  }
}
