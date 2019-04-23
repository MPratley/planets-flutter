import 'package:flutter/material.dart';
import 'package:planets/model/Planet.dart';
import 'package:planets/ui/common/PlanetSummary.dart';
import 'package:planets/ui/common/Separator.dart';
import 'package:planets/ui/text_style.dart';
import 'package:transparent_image/transparent_image.dart';


class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    var _background = Container(
      child: FadeInImage.memoryNetwork(
        image: planet.picture,
        placeholder: kTransparentImage,
        fit: BoxFit.cover,
        height: 300,
      ),
      constraints: BoxConstraints.expand(height: 300),
    );
    var _gradient = Container(
      margin: EdgeInsets.only(top: 190),
      height: 110,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0x003e3963), Color(0xFF3e3963)],
              stops: [0, 0.9],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(0, 1))),
    );
    var _content = ListView(
      padding: EdgeInsets.fromLTRB(0, 72, 0, 32),
      children: <Widget>[
        PlanetSummary.vertical(planet),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "OVERVIEW",
                style: headerTextStyle,
              ),
              Separator(),
              Text(planet.description, style: subHeaderTextStyle)
            ],
          ),
        )
      ],
    );
    var _toolbar = Container();
    return Scaffold(
      body: Container(
        color: Color(0xFF3e3963),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[_background, _gradient, _content, _toolbar],
        ),
      ),
    );
  }
}
