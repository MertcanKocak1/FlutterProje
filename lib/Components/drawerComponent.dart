import 'package:flutter/material.dart';
import 'package:proje/screens/LoginPage.dart';
import 'package:proje/screens/SettingsPage.dart';
import 'package:proje/screens/UserAboutPage.dart';
import 'package:proje/screens/adminNewCarPage.dart';
import 'package:proje/screens/homePage.dart';
import '../services/auth.dart';

Widget drawerComponent(context) {
  final email = AuthService().currentUser();
  final uid = AuthService().currentUserId();
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromRGBO(187, 121, 237, 0.6),
          ),
          accountEmail: Text(
            email,
            style: TextStyle(fontSize: 20),
          ),
          currentAccountPicture: Icon(Icons.supervised_user_circle),
        ),
        ListTile(
          title: Text("Anasayfa"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        ListTile(
          title: Text("Hakkımda"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserPage(context)));
          },
        ),
        ListTile(
          title: Text("Araç Ekle"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewCar()));
          },
        ),
        ListTile(
          title: Text("Ayarlar"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserPage(context)));
          },
        ),
        ListTile(
          title: Text("Çıkış Yap"),
          onTap: () {
            AuthService().signOut();
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ],
    ),
  );
}
