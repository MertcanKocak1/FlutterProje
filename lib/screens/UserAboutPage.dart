import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/appBar.dart';
import 'package:proje/Components/drawerComponent.dart';
import 'package:proje/classes/CarOwner.dart';
import 'package:proje/services/CarsService.dart';

import 'details.dart';

class UserPage extends StatefulWidget {
  String mypost = "";

  UserPage(String mypost) {
    mypost = mypost;
}

  _UserPageState createState() => _UserPageState(mypost);
}

class _UserPageState extends State {
  CarsService _carsService = CarsService();
  String _mypost;

  _UserPageState(String mypost) {
    this._mypost = mypost;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBar(_mypost),
      drawer: drawerComponent(context),
      body: buildOwnerCars(),
    );
  }
  Widget ArabaYapici(BuildContext ctx,DocumentSnapshot _mypost) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(_mypost)));
        },
        child: Hero(
          tag: _mypost,
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
                            _mypost['resim'],
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
                            _mypost['baslik'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Aracımız " +
                                _mypost['kisiSayisi'].toString() +
                                " kişiliktir.",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            _mypost['aciklama'],
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
  Widget buildOwnerCars() {
      return StreamBuilder(
          stream: _carsService.getUserCars(_mypost),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Center(
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot snap = snapshot.data.docs[index];
                        return ArabaYapici(context, snap);
                      },
                    ),
                  Text(snapshot.data.docs.length.toString())],
                ),
              );
            }
            else{
              return Text("VERİ YOK");
           }
          });
    }
  }
