import 'package:flutter/material.dart';
import 'page2.dart';

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

  void _goPage2(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }

  Widget _bodyWidget(){
    return new Container(
      padding: const EdgeInsets.only(top: 140.0, left: 10.0, right: 10.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Image.asset(
              'images/transpole_logo2.png',
              fit: BoxFit.cover,
            ),
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new RaisedButton(
                color: Theme.of(context).accentColor,
                child: new Text(
                  "CLICK",
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: _goPage2,
              )
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

