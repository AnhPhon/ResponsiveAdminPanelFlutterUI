import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responui/constants.dart';
import 'package:responui/responsive_layout.dart';

// ignore: unused_element
List<String> _buttonNames = [
  'Overview',
  'Revenue',
  'Sales',
  'Control',
];
// ignore: unused_element
int _currentIndex = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Welcome back!',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white),
            ),
          SizedBox(
            width: 10,
          ),
          Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.grey[700],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(Constants.kPadding / 2),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: _currentIndex == index
                              ? LinearGradient(
                                  colors: <Color>[
                                    Constants.redDark,
                                    Constants.orangeDark
                                  ],
                                )
                              : null,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                children: [
                  Text(
                    _buttonNames[_currentIndex],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Constants.redDark,
                          Constants.orangeDark
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          Spacer(),
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          Stack(
            children: [
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notifications, color: Colors.white),
              ),
              Positioned(
                right: 5,
                top: 2,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '8',
                        style: GoogleFonts.ubuntu(
                            fontSize: 10, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: Colors.black45,
                    spreadRadius: 1,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
            )
        ],
      ),
    );
  }
}
