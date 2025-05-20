import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String profileImage =
        "https://media.licdn.com/dms/image/v2/D4D03AQElAqsuSWTylw/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1727787164957?e=2147483647&v=beta&t=7yHXUvhWE3H0cQIBDFo7kduiAwXM7acyy-_eDh2KpFg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "Anurag Suthar",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  "anurag.suthar@g-axon.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 50,

                  backgroundImage: NetworkImage(profileImage),
                ),
                margin: EdgeInsets.zero,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              iconColor: Colors.white,
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              iconColor: Colors.white,
              title: Text(
                "Profile",
                textScaler: TextScaler.noScaling,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              iconColor: Colors.white,
              title: Text(
                "Email me ",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
