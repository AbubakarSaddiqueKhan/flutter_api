import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/users/users_api_service.dart';
import 'package:flutter_json_placeholder_api/users/user_data_model.dart';

class DisplayUserScreen extends StatefulWidget {
  const DisplayUserScreen({super.key});

  @override
  State<DisplayUserScreen> createState() => _DisplayUserScreenState();
}

class _DisplayUserScreenState extends State<DisplayUserScreen> {
  late List<UserDataModel> user_data_model_list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    user_data_model_list = (await UsersApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        centerTitle: true,
      ),
      body: user_data_model_list == null || user_data_model_list!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: user_data_model_list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(user_data_model_list[index].id.toString()),
                    Text(user_data_model_list[index].name),
                    Text(user_data_model_list[index].username),
                    Text(user_data_model_list[index].phone),
                    Text(user_data_model_list[index].email),
                    Text(user_data_model_list[index].website),
                    Text(user_data_model_list[index].address.toString()),
                    Text(user_data_model_list[index].company.toString())
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            getData();
          }),
    );
  }
}
