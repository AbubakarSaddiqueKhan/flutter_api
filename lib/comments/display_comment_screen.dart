import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/comments/comment_api_service.dart';
import 'package:flutter_json_placeholder_api/comments/comments_data_model.dart';

class DisplayCommentScreen extends StatefulWidget {
  const DisplayCommentScreen({super.key});

  @override
  State<DisplayCommentScreen> createState() => _DisplayCommentScreenState();
}

class _DisplayCommentScreenState extends State<DisplayCommentScreen> {
  late List<CommentDataModel> commentDataModelList = [];

  @override
  void initState() {
    super.initState();
    getCommentsData();
  }

  void getCommentsData() async {
    commentDataModelList = (await CommentApiService().getCommentData())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comments Data"),
          centerTitle: true,
        ),
        body: commentDataModelList.length == null ||
                commentDataModelList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: commentDataModelList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text("Id : ${commentDataModelList[index].id.toString()}"),
                      Text("Post Id : ${commentDataModelList[index].postId}"),
                      Text("Name : ${commentDataModelList[index].name}"),
                      Text("Email : ${commentDataModelList[index].email}"),
                      Text("Body : ${commentDataModelList[index].body}")
                    ],
                  );
                },
              ));
  }
}
