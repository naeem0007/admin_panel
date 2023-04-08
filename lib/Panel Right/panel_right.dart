import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import 'wiggle_chart.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({super.key});

  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  final List<Product> _products = [
    Product(name: "LED Submersible Lights", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Temporary Tattoos", enable: true),
    Product(name: "Bookends", enable: true),
    Product(name: "Vegetable Chopper", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Facial Cleanser", enable: true),
    Product(name: "Back Cushion", enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: Constants.kPadding,
                  left: Constants.kPadding / 2,
                  right: Constants.kPadding / 2),
              child: Card(
                  elevation: 3,
                  color: Constants.purpleLight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      title: Text(
                        "Net Revenue",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "11% Sales of average",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Chip(
                          label: Text(
                        r"$50,599",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )),
            ),
            //Chart
            const LineChartSample1(),

            Padding(
              padding: const EdgeInsets.only(
                  top: Constants.kPadding,
                  left: Constants.kPadding / 2,
                  right: Constants.kPadding / 2),
              child: Card(
                elevation: 3,
                color: Constants.purpleLight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: List.generate(
                      _products.length,
                      (index) => SwitchListTile.adaptive(
                          title: Text(
                            _products[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: _products[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _products[index].enable = newValue;
                            });
                          })),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
