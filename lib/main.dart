import 'package:admin_panel/const.dart';
import 'package:admin_panel/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WidgetTree(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Constants.purpleDark,
          canvasColor: Constants.purpleLight),
    );
  }
}
