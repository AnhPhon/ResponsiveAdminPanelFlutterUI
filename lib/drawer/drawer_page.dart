import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responui/constants.dart';
import 'package:responui/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class ButtonsInfor {
  String title;
  IconData icon;
  ButtonsInfor({required this.title, required this.icon});
}

// ignore: unused_element
int _currentIndex = 0;
// ignore: unused_element
List<ButtonsInfor> _buttonNames = [
  ButtonsInfor(title: 'Home', icon: Icons.home),
  ButtonsInfor(title: 'Setting', icon: Icons.settings),
  ButtonsInfor(title: 'Notifications', icon: Icons.notifications),
  ButtonsInfor(title: 'Contacts', icon: Icons.contact_phone_rounded),
  ButtonsInfor(title: 'Sales', icon: Icons.sell),
  ButtonsInfor(
    title: 'Marketing',
    icon: Icons.mark_email_read,
  ),
  ButtonsInfor(
    title: 'Security',
    icon: Icons.verified_user,
  ),
  ButtonsInfor(
    title: 'Users',
    icon: Icons.supervised_user_circle_outlined,
  ),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Admin Menu',
                  style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.menu_outlined, color: Colors.white),
                      ),
              ),
              //We create a list of widget so we need to add the ... to tell FLutter
              // that it's a list instead of creating and orther Colum
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Constants.redDark.withOpacity(.9),
                                  Constants.orangeDark.withOpacity(.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(_buttonNames[index].icon,
                              color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
