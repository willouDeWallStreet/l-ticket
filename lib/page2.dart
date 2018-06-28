import 'package:flutter/material.dart';

class SecondScreen extends MaterialPageRoute<Null> {
  SecondScreen() : super(builder: (BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: new Text('Transpole MAP Page')
        ),
      ),
      body: _bodyMapPageWidget()
    );
  });
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