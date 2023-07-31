// To parse this JSON data, do
//
//     final todosDataModel = todosDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TodosDataModel> todosDataModelFromJson(String str) =>
    List<TodosDataModel>.from(
        json.decode(str).map((x) => TodosDataModel.fromJson(x)));

String todosDataModelToJson(List<TodosDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosDataModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodosDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  TodosDataModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) =>
      TodosDataModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );

  factory TodosDataModel.fromJson(Map<String, dynamic> json) => TodosDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
