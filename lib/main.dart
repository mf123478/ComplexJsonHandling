import 'package:apis_project/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "app",
      home: HomePage(),
    );
  }
}
