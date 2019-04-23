import 'package:flutter/material.dart';
import 'package:planets/ui/detail/DetailPage.dart';
import 'package:planets/ui/home/HomePage.dart';

void main() {
  // Routes.initRoutes();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Planets",
    home: HomePage(),
    // routes: <String, WidgetBuilder>{
    //   '/detail': (_) => DetailPage()
    // },
  ));
}
