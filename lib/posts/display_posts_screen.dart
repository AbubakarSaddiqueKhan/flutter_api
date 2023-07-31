import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/posts/posts_api_service.dart';
import 'package:flutter_json_placeholder_api/posts/posts_data_model.dart';

class DisplayPostsScreen extends StatefulWidget {
  const DisplayPostsScreen({super.key});

  @override
  State<DisplayPostsScreen> createState() => _DisplayPostsScreenState();
}

class _DisplayPostsScreenState extends State<DisplayPostsScreen> {
  late List<PostDataModel> postDataModelList = [];

  @override
  void initState() {
    super.initState();
    getPostsData();
    print(postDataModelList.length);
  }

  void getPostsData() async {
    postDataModelList = (await PostsApiService().getPostsData())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
        centerTitle: true,
      ),
      body: postDataModelList == null || postDataModelList!.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postDataModelList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(postDataModelList[index].id.toString()),
                    Text(postDataModelList[index].userId.toString()),
                    Text(postDataModelList[index].title),
                    Text(postDataModelList[index].body)
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            getPostsData();
          }),
    );
  }
}
