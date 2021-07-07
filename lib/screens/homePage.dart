import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/Arabalar.dart';
import 'package:proje/Components/drawerComponent.dart';
import 'package:proje/classes/CarOwner.dart';
import 'package:proje/screens/UserAboutPage.dart';

import 'package:proje/screens/details.dart';
import 'package:proje/services/CarsService.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/inuxe/AndroidStudioProjects/proje/lib/services/auth.dart';
import 'adminNewCarPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.baslik}) : super(key: key);
  final String baslik;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  CarsService _carsService = CarsService();
  Widget ArabaYapici(BuildContext ctx, mypost) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(mypost)));
        },
        child: Hero(
      tag: mypost,
      child: Card(
          margin: EdgeInsets.all(8),
          elevation: 2.0,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Container(
                  height: 120,
                  width: 120,
                  padding: EdgeInsets.all(16),
                  child: FittedBox(
                      child:Image.network(
                    mypost['resim'],
                    fit: BoxFit.fill,
                  ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mypost['baslik'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Aracımız " +
                            mypost['kisiSayisi'].toString() +
                            " kişiliktir.",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        mypost['aciklama'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ]),
            Icon(
              Icons.navigate_next,
              color: Colors.black38,
            ),
          ])),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Color.fromRGBO(187, 121, 237, 0.8),
      ),
      drawer: drawerComponent(context),
      body: StreamBuilder(
          stream: _carsService.getCars(),
          builder: (context,snapshot) {
            return Center(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snapshot.data.docs[index];
                      return ArabaYapici(context, mypost);
                    },
                  ),
                ],
              ),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
