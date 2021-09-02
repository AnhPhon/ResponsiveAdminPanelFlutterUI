import 'package:flutter/material.dart';
import 'package:responui/constants.dart';
import 'package:responui/widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive UI Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight,
      ),
      home: WidgetTree(),
    );
  }
}
