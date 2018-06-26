import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("images/transpole_logo.png");
    var image = new Image(image: assetImage, width: 70.0, height: 40.0,);
    return new Container(child: image);
  }
}