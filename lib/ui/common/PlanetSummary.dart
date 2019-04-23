import 'package:flutter/material.dart';
import 'package:planets/model/Planet.dart';
import 'package:planets/ui/common/Separator.dart';
import 'package:planets/ui/detail/DetailPage.dart';
import 'package:planets/ui/text_style.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal = true});
  PlanetSummary.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: new Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text(value, style: regularTextStyle),
        ]),
      );
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 2.0),
          new Text(planet.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(planet.location, style: subHeaderTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')),
              new Container(
                width: horizontal ? 8.0 : 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = Hero(
        tag: 'hero-planet-card-${planet.id}',
        child: Container(
          child: planetCardContent,
          height: horizontal ? 124.0 : 154.0,
          margin: horizontal
              ? EdgeInsets.only(left: 46.0)
              : EdgeInsets.only(top: 72.0),
          decoration: BoxDecoration(
            color: Color(0xFF434273),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
        ));

    return GestureDetector(
        onTap: horizontal
            ? () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(planet)))
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }
}
