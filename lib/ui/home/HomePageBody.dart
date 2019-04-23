import 'package:flutter/material.dart';
import 'package:planets/planets.dart';
import 'package:planets/ui/common/PlanetSummary.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF3e3963),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 100,
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF00CCFF)
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1, 0.0),
                        stops: [0.0, 1],
                        tileMode: TileMode.clamp),
                  ),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "planets",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 36.0),
                      ),
                    ),
                    centerTitle: true,
                    background: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover,
                        image:
                        "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/45025340661_7b9f8f9402_k.jpg"),
                  )),
              floating: false,
              pinned: true,
              snap: false,
            ),
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
