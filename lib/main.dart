import 'package:flutter/material.dart';
import 'package:flutter_json_placeholder_api/albums/display_albums_screen.dart';
import 'package:flutter_json_placeholder_api/comments/display_comment_screen.dart';
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DisplayTodosScreen();
  }
}
