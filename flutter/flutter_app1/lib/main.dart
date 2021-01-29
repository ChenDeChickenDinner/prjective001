

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() {

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: Center(
        child: myImageAndIcon(),
      ),
    ),
  ));

}


class myImageAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



