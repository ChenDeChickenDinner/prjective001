import 'package:flutter/material.dart';


void main() {
  runApp(materialAppCreate());
}

MaterialApp materialAppCreate() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: myText(),
      ),
    ),
  );
}

class myText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text ob = Text("123");

    return ob;
  }
}

