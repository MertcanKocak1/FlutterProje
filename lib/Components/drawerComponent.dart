import 'package:flutter/material.dart';
import 'package:proje/screens/SettingsPage.dart';

Widget drawerComponent() {
  return Drawer(
      child: ListView(children: [
    UserAccountsDrawerHeader(
      accountName: Text("Mertcan"),
      accountEmail: Text("accountEmail"),
      currentAccountPicture: Icon(Icons.supervised_user_circle),
    ),
    ListTile(
        title: Text("Hakkımda"),
        onTap: () {
         // Navigator.of(context).pop();
          //Navigator.push(
            //  context,
            //  MaterialPageRoute(
             //     builder: (BuildContext context) => SettingsPage()));
        })
  ]));
}
