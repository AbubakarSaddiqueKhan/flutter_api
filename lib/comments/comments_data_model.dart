// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final commentDataModel = commentDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

// List<CommentDataModel> commentDataModelFromJson(String str) =>
//     List<CommentDataModel>.from(
//         json.decode(str).map((x) => CommentDataModel.fromJson(x)));

// String commentDataModelToJson(List<CommentDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentDataModel {
  int postId;
  int id;
  String name;
  String email;
  String body;
  CommentDataModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  // CommentDataModel({
  //   required this.postId,
  //   required this.id,
  //   required this.name,
  //   required this.email,
  //   required this.body,
  // });

  // CommentDataModel copyWith({
  //   int? postId,
  //   int? id,
  //   String? name,
  //   String? email,
  //   String? body,
  // }) =>
  //     CommentDataModel(
  //       postId: postId ?? this.postId,
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       email: email ?? this.email,
  //       body: body ?? this.body,
  //     );

  // factory CommentDataModel.fromJson(Map<String, dynamic> json) =>
  //     CommentDataModel(
  //       postId: json["postId"],
  //       id: json["id"],
  //       name: json["name"],
  //       email: json["email"],
  //       body: json["body"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "postId": postId,
  //       "id": id,
  //       "name": name,
  //       "email": email,
  //       "body": body,
  //     };

  CommentDataModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentDataModel(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentDataModel.fromMap(Map<String, dynamic> map) {
    return CommentDataModel(
      postId: map['postId'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentDataModel.fromJson(String source) =>
      CommentDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentDataModel(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant CommentDataModel other) {
    if (identical(this, other)) return true;

    return other.postId == postId &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        body.hashCode;
  }
}
