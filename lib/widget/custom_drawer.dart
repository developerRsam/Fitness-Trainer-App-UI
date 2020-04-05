import 'package:flutter/material.dart';

import '../screens/welcome_screen.dart';

class CustomDrawer extends StatelessWidget {
  //static const routeName = '/routeName'; //for navigation route
  //bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: ListView(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                width: 190.0,
                height: 190.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF4CDA63),
                      width: 4,
                    ),
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage('assets/images/bg3.jpg')))),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: new Text("RS Doe", textScaleFactor: 1.5),
            )
          ],
        ),
        Divider(),
        ListTile(
          title: Text(
            'My Workouts',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'My Diet',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Trainer',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).popAndPushNamed(WelcomeScreen.routeName);
            //isTapped = !isTapped;
          },
          title: Text(
            'Logout',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        Center(
          child: Text(
            'RS Studios',
            style: TextStyle(color: Color(0xFF4CDA63)),
          ),
        )
      ]),
    );
  }
}
