import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HomeScreen'),
      ),
      body: new Center(
        child: new Text('Welcome to Home.!'),
      ),
    );
  }
}

Widget _bodyMapPageWidget(){
  return new Container(
    child: new Column(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(top: 160.0, left: 5.0, right: 5.0),
          child: new Image.network('https://maps.googleapis.com/maps/api/staticmap?center=37.0902%2C-95.7192&zoom=4&size=600x400&googleMapsApiKey'),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Départ'
            ),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Arrivée'
            ),
          ),
        )
      ]
    )
  );
}