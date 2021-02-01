


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "123",
    home: Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: Center(
        child: BoxContainer(),
      ),
    ),
  ));
}

class BoxContainer extends StatefulWidget {
  @override
  _BoxContainerState createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer> {
  @override
  Widget build(BuildContext context) {
    return boxC1();
  }
}

/* 自身管理
 *
 * */
class BoxA extends StatefulWidget {
  @override
  _BoxAState createState() => _BoxAState();
}

class _BoxAState extends State<BoxA> {

  bool _active = true;
  void _handleTep(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {

    return boxCreate(_handleTep, _active);
  }
}
/*父级管理
*
* */
class BoxB extends StatefulWidget {
  @override
  _BoxBState createState() => _BoxBState();
}

class _BoxBState extends State<BoxB> {
  bool _active = false;
  void _handleTapboxChanged(bool active){
    setState(() {
      _active = active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BoxB2(active: _active,onChanged: _handleTapboxChanged);
  }
}

class BoxB2 extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  BoxB2({this.active,this.onChanged});
  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return boxCreate(_handleTap, active);
  }
}

/*混合管理
*
* */
class boxC1 extends StatefulWidget {
  @override
  _boxC1State createState() => _boxC1State();
}

class _boxC1State extends State<boxC1> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState((){
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return boxC2(active: _active,onChanged: _handleTapboxChanged);
  }
}


class boxC2 extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  boxC2({this.active,this.onChanged});
  @override
  _boxC2State createState() => _boxC2State();
}

class _boxC2State extends State<boxC2> {
  bool _highlighe = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlighe = true;
    });
  }
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlighe = false;
    });
  }
  void _handleTapCancel(){
    setState(() {
      _highlighe = false;
    });
  }
  void _handLeTap(){
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp:_handleTapUp ,
      onTapCancel: _handleTapCancel,
      onTap: _handLeTap,
      child: Container(
        child: Center(
          child: Text(
            widget.active?"Active":"Inactive",
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
            border: _highlighe?Border.all(
                color: Colors.teal[700],
                width: 10.0
            ):null
        ),
      ),
    );
  }
}






Widget boxCreate(Function fun,bool active){
  return GestureDetector(
    onTap: fun,
    child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
        )
    ),
  );
}
