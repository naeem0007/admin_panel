import 'package:admin_panel/const.dart';
import 'package:admin_panel/responsive_layout.dart';
import 'package:flutter/material.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(children: [
        if (ResponsiveLayout.isComputer(context))
          Container(
            margin: const EdgeInsets.all(Constants.kPadding),
            height: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ],
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Image.asset("Images/tlogo.png"),
            ),
          )
        else
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        const SizedBox(
          width: Constants.kPadding,
        ),
        const Spacer(),
        if (ResponsiveLayout.isComputer(context))
          ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                  onPressed: () {
                    setState(() {
                      _currentSelectedButton = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.kPadding),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _buttonNames[index],
                            style: TextStyle(
                                color: _currentSelectedButton == index
                                    ? Colors.white
                                    : Colors.white70),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.all(Constants.kPadding / 2),
                            width: 60,
                            height: 2,
                            decoration: BoxDecoration(
                                gradient: _currentSelectedButton == index
                                    ? const LinearGradient(colors: [
                                        Constants.red,
                                        Constants.orange
                                      ])
                                    : null),
                          )
                        ]),
                  )))
        else
          Padding(
            padding: const EdgeInsets.all(Constants.kPadding * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _buttonNames[_currentSelectedButton],
                  style: const TextStyle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.all(Constants.kPadding / 2),
                  width: 60,
                  height: 2,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Constants.red, Constants.orange])),
                )
              ],
            ),
          ),
        const Spacer(),
        IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.search)),
        Stack(
          children: [
            IconButton(
                iconSize: 30,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined)),
            const Positioned(
              right: 6,
              top: 6,
              child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.pink,
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
            )
          ],
        ),
        if (!ResponsiveLayout.isPhone(context))
          Container(
            margin: const EdgeInsets.all(Constants.kPadding),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ],
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Constants.orange,
              child: Image.asset("Images/prfl.png"),
            ),
          )
      ]),
    );
  }
}
