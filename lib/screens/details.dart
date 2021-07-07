import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/Arabalar.dart';
import 'package:proje/screens/UserAboutPage.dart';

class Details extends StatefulWidget {
  DocumentSnapshot _mypost;

  Details(DocumentSnapshot mypost) {
    _mypost = mypost;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailsState(_mypost);
  }
}

class _DetailsState extends State {
  DocumentSnapshot _mypost;
  _DetailsState(DocumentSnapshot _mypost) {
    this._mypost = _mypost;
  }
  String mail = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_mypost['baslik']),
        backgroundColor: Color.fromRGBO(187, 121, 237, 0.5),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
              tag: _mypost,
              child: Container(
                height: 250,
                width: double.infinity,
                child: FittedBox(
                    child: Image.network(
                  _mypost['resim'],
                  fit: BoxFit.fill,
                )),
              )),
          Container(
              padding: EdgeInsets.all(40),
              height: 350,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_mypost['baslik'],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Divider(
                    thickness: 2,
                  ),
                  Text(_mypost['sehir'],
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  GestureDetector(
                    child: Text(
                        "Kiralıyan Kişi : " +
                            _mypost['kiraliyanKisi'] ,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    onTap: () {
                      setState(() {
                        mail = _mypost['kiraliyanKisi'].toString();
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserPage(mail)));
                    },
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Text("Araç " + _mypost['kisiSayisi'].toString() + " kişiliktir",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  Text(_mypost['aciklama'],
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  Text("Günlük Fiyatı : " + _mypost['fiyat'].toString(),
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  )
                ],
              ))
        ],
      )),
    );
  }
}
