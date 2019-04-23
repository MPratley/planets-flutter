import 'package:flutter/material.dart';
import 'package:planets/planets.dart';
import 'package:planets/ui/common/PlanetSummary.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF3e3963),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 24),
                sliver: SliverFixedExtentList(
                  itemExtent: 152,
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => PlanetSummary(planets[index]),
                      childCount: planets.length),
                ))
          ],
        ),
      ),
    );
    // return PlanetRow(planets[0]);
  }
}
