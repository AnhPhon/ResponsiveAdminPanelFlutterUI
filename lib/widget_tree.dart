import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responui/app_bar/app_bar_widget.dart';
import 'package:responui/constants.dart';
import 'package:responui/drawer/drawer_page.dart';
import 'package:responui/panel_center/panel_center_page.dart';
import 'package:responui/panel_left/panel_left_page.dart';
import 'package:responui/panel_right/panel_right_page.dart';
import 'package:responui/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int _currentIndex = 1;
    // ignore: unused_local_variable
    List<Widget> _icons = [
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : AppBarWidget()),
        preferredSize: Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: _currentIndex == 0
            ? PanelLeftPage()
            : _currentIndex == 1
                ? PanelCenterPage()
                : PanelRightPage(),
        table: Row(
          children: [
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
          ],
        ),
        largeTable: Row(
          children: [
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            ),
          ],
        ),
        computer: Row(
          children: [
            Expanded(
              child: DrawerPage(),
            ),
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            ),
          ],
        ),
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: _currentIndex,
              backgroundColor: Constants.purpleDark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}
