import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Transpole',
      home: new HomePage(),
    );
  }
}
    
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

  String text = "Great App, isn't it ?";

  void _changeText(){
    setState(() {
      if(text.startsWith("G")){
        text = "WHAOOOU !";
      }else{
        text = "Great App, isn't it ?";
      }
    });
  }

  Widget _bodyWidget(){
    return new Container(
      padding: const EdgeInsets.all(50.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Text(text),
            new RaisedButton(
              child: new Text("CLICK"),
              onPressed: _changeText,
            ),
            new Image.asset(
              'images/transpole_logo.png',
              fit: BoxFit.cover,
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('Transpole Home Page')
          ),
      ),
      body: _bodyWidget()
    );
  }
}
