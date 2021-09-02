import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responui/constants.dart';
import 'package:responui/panel_left/Curved_chart_2nd.dart';
import 'package:responui/panel_left/curved_chart.dart';
import 'package:responui/responsive_layout.dart';

// ignore: camel_case_types
class toDo {
  String name;
  bool enabled = false;
  toDo({required this.name, required this.enabled});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  // ignore: unused_field
  List<toDo> _toDo = [
    toDo(name: "Purchase Paper", enabled: true),
    toDo(name: "Refill the inventory of speakers", enabled: true),
    toDo(name: "Hire someone", enabled: true),
    toDo(name: "Maketing Strategy", enabled: true),
    toDo(name: "Selling furniture", enabled: true),
    toDo(name: "Finish the disclosure", enabled: true),
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
                decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Constants.kPadding / 2,
                      left: Constants.kPadding,
                      right: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          'Products Sold',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                        subtitle: Text(
                          '20% of Products Sold',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            '10,399',
                            style: GoogleFonts.ubuntu(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      LineChartSample1(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      BarChartSample1(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: Constants.kPadding / 2,
                      bottom: Constants.kPadding * 2,
                      top: Constants.kPadding,
                      left: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...List.generate(
                            _toDo.length,
                            (index) => CheckboxListTile(
                              title: Text(
                                _toDo[index].name,
                                style: GoogleFonts.ubuntu(color: Colors.white),
                              ),
                              value: _toDo[index].enabled,
                              onChanged: (newValue) {
                                setState(() {
                                  _toDo[index].enabled = newValue ?? true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
