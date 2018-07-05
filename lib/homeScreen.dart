import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

var apiKey = "AIzaSyDAU_exWXE3Pq99vWF3zO3xVx7rhoym_QA";

void homePage(){
  MapView.setApiKey(apiKey);
  runApp(new MaterialApp(
    home: new HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = new TextEditingController();

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(apiKey);
  Uri staticMapUri;

  List<Marker> markers = <Marker>[
    new Marker("1", "HEI", 50.633901, 3.045088,
        color: Colors.blue),
    new Marker("2", "Le Bô Bar", 50.631462, 3.049565,
        color: Colors.red),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraPosition =
        new CameraPosition(new Location(50.627104, 3.039928), 2.0);
    staticMapUri = staticMapProvider.getStaticUri(
        new Location(50.627104, 3.039928), 16,
        height: 600, width: 900, mapType: StaticMapViewType.roadmap);
    textController.addListener(printSomeValues);
  }

  printSomeValues(){
    print("Controller value = ${textController.text}");
  }

  @override
  void dispose(){
    textController.removeListener(printSomeValues);
    textController.dispose();
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: Center(
          child: Text("L-Ticket maps"),
        )
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 300.0,
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: Container(
                    child: new Text(
                      "Map should show here",
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
                new InkWell(
                  child: new Center(
                    child: new Image.network(staticMapUri.toString()),
                  ),
                ),
              ]
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(labelText: "Email"),
                    validator: (val) =>
                        !val.contains('@') ? 'Invalid Email' : null,
                    onSaved: (val) => _email = val,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: "Password"),
                    validator: (val) =>
                        val.length < 6 ? 'Password too short' : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  new RaisedButton(
                    child: new Text(
                      "login",
                      style: new TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: _submit,
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}