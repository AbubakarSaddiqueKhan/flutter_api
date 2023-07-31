import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/todos/todo_api_service.dart';
import 'package:flutter_json_placeholder_api/todos/todo_data_model.dart';

class DisplayTodosScreen extends StatefulWidget {
  const DisplayTodosScreen({super.key});

  @override
  State<DisplayTodosScreen> createState() => _DisplayTodosScreenState();
}

class _DisplayTodosScreenState extends State<DisplayTodosScreen> {
  late List<TodosDataModel> todosDataModelList = [];

  @override
  void initState() {
    super.initState();
    getTodosData();
  }

  void getTodosData() async {
    todosDataModelList = (await TodoApiService().getTodosData())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todos Data"),
          centerTitle: true,
        ),
        body: todosDataModelList == null || todosDataModelList!.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: todosDataModelList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(" Id :  ${todosDataModelList[index].id}"),
                      Text(" Title ${todosDataModelList[index].title}"),
                      Text(" User Id ${todosDataModelList[index].userId}"),
                      Text(" Completed ${todosDataModelList[index].completed}")
                    ],
                  );
                },
              ));
  }
}
