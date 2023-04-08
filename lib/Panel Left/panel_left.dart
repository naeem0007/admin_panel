import 'package:admin_panel/Panel%20Left/curved_chart.dart';
import 'package:admin_panel/const.dart';
import 'package:admin_panel/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'circle_graph.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({super.key});

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _todo = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Maketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                    color: Constants.purpleDark,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: Constants.kPadding,
                      left: Constants.kPadding,
                      right: Constants.kPadding),
                  child: Card(
                    elevation: 3,
                    color: Constants.purpleLight,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          "Product Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "18 % of Product Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                            label: Text(
                          "4500",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
                //GRAPH 1
                const LineChartSample2(),
                //GRAPH 2
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: Constants.kPadding / 2,
                      left: Constants.kPadding / 2,
                      right: Constants.kPadding,
                      bottom: Constants.kPadding),
                  child: Card(
                    elevation: 3,
                    color: Constants.purpleLight,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: List.generate(
                          _todo.length,
                          (index) => CheckboxListTile(
                              title: Text(
                                _todo[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              value: _todo[index].enable,
                              onChanged: (newValue) {
                                setState(() {
                                  _todo[index].enable = newValue ?? true;
                                });
                              })),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
