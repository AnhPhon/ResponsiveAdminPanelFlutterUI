import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responui/constants.dart';
import 'package:responui/panel_center/chart_center.dart';

class Person {
  String name;
  String srname;
  Color color;
  Person({required this.name, required this.color, required this.srname});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  _PanelCenterPageState createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  List<Person> _person = [
    Person(name: 'Nguyen Van', color: Colors.red, srname: 'A'),
    Person(name: 'Nguyen Van', color: Colors.yellow, srname: 'B'),
    Person(name: 'Nguyen Van', color: Colors.blue, srname: 'C'),
    Person(name: 'Nguyen Van', color: Colors.red, srname: 'D'),
    Person(name: 'Nguyen Van', color: Colors.yellow, srname: 'E'),
    Person(name: 'Nguyen Van', color: Colors.red, srname: 'F'),
    Person(name: 'Nguyen Van', color: Colors.blue, srname: 'G'),
    Person(name: 'Nguyen Van', color: Colors.yellow, srname: 'H'),
    Person(name: 'Nguyen Van', color: Colors.red, srname: 'Y'),
    Person(name: 'Nguyen Van', color: Colors.blue, srname: 'K'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
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
                      'Products Available',
                      style: GoogleFonts.ubuntu(color: Colors.white),
                    ),
                    subtitle: Text(
                      '70% of Products Available',
                      style: GoogleFonts.ubuntu(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        '30,399',
                        style: GoogleFonts.ubuntu(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  BarChartSample4(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                        _person.length,
                        (index) => ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            backgroundColor: _person[index].color,
                            child: Text(
                              _person[index].srname.substring(0, 1),
                              style: GoogleFonts.ubuntu(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            '${_person[index].name} ${_person[index].srname}',
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontSize: 18),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
