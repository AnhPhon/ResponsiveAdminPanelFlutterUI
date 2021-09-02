import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.phone,
      required this.table,
      required this.largeTable,
      required this.computer,
      required this.tiny})
      : super(key: key);
  final Widget tiny;
  final Widget phone;
  final Widget table;
  final Widget largeTable;
  final Widget computer;

  static final int tinyHeightLimit = 100;
  static final int tinyLimit = 270;
  static final int phoneLimit = 550;
  static final int tableLimit = 800;
  static final int largeTableLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;
  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;
  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;
  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width < tableLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;
  static bool isLargeTable(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTableLimit &&
      MediaQuery.of(context).size.width >= tableLimit;
  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTableLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < tinyLimit ||
          constraints.maxHeight < tinyHeightLimit) {
        return tiny;
      }
      if (constraints.maxWidth < phoneLimit) {
        return phone;
      }
      if (constraints.maxWidth < tableLimit) {
        return table;
      }
      if (constraints.maxWidth < largeTableLimit) {
        return largeTable;
      } else {
        return computer;
      }
    });
  }
}
