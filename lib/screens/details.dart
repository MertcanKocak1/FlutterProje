import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/Arabalar.dart';
import 'package:proje/screens/UserAboutPage.dart';

class Details extends StatefulWidget {
  Araba _araba;

  Details(Araba araba) {
    _araba = araba;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailsState(_araba);
  }
}

class _DetailsState extends State {
  Araba araba;

  _DetailsState(Araba araba) {
    this.araba = araba;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(araba.baslik),
        backgroundColor: Color.fromRGBO(187, 121, 237, 0.5),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
              tag: araba,
              child: Container(
                height: 250,
                width: double.infinity,
                child: FittedBox(
                    child: Image.asset(
                  araba.resim,
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
                  Text(araba.baslik,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Divider(
                    thickness: 2,
                  ),
                  Text(araba.sehir,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  GestureDetector(
                    child: Text(
                        "Kiralıyan Kişi : " +
                            araba.kiraliyacakKisi ,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserPage(context)));
                    },
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Text("Araç " + araba.kisi.toString() + " kişiliktir",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  Text(araba.aciklama,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  Text("Günlük Fiyatı : " + araba.fiyat.toString(),
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
