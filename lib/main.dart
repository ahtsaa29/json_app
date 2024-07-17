import 'package:flutter/material.dart';
import 'package:json_api/provider/album_provider.dart';
import 'package:json_api/provider/note_provider.dart';
import 'package:json_api/provider/todo_provider.dart';
import 'package:json_api/view/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AlbumProvider()),
    ChangeNotifierProvider(create: (_) => NoteProvider()),
    ChangeNotifierProvider(create: (_) => TodoProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
