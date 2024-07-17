import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_api/view/pages/albums.dart';
import 'package:json_api/view/pages/notes.dart';
import 'package:json_api/view/pages/todos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (index) {
          log(index.toString());
          setState(() {
            navIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albums"),
          BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined), label: "Todos"),
        ],
      ),
      body: navIndex == 0
          ? const Notes()
          : navIndex == 1
              ? const Albums()
              : const Todos(),
    ));
  }
}
