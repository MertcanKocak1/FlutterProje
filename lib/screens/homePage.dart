import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/Arabalar.dart';
import 'package:proje/classes/CarOwner.dart';
import 'package:proje/screens/UserAboutPage.dart';
import 'package:proje/Components/UserLoggedInAppBar.dart';
import 'package:proje/screens/details.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({Key key, this.baslik}) : super(key: key);
  final String baslik;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State {
  List<Araba> arabalar = new List<Araba>();
  List<CarOwner> carOwner = new List<CarOwner>();

  _HomePageState() {
    arabalar.add(new Araba("Nissan Qasqai", 350, 2, "assets/araba.png",
        "Az Kullanılmış Uzun Mesafe Gidebilir", "Ankara", "Tolga Koçak"));
    arabalar.add(new Araba("Mercedes AMG", 450, 4, "assets/araba1.png",
        "Az Kullanılmış İçerisi Temiz", "Ankara", "Tolga Koçak"));
    arabalar.add(new Araba("Honda Civic", 450, 4, "assets/araba2.png",
        "Uzun yol ve aile için uygun", "Ankara", "Tolga Koçak"));
    arabalar.add(new Araba("Porsche Cayenne", 450, 4, "assets/araba3.png",
        "Düğünlere araba kiralanır ", "Ankara", "Tolga Koçak"));
    arabalar.add(new Araba(
        "Ferrari 458",
        450,
        4,
        "assets/araba3.png",
        "Ferrari için bir açıklama yazmama gerek yok",
        "Ankara",
        "Tolga Koçak"));
    carOwner.add(
        new CarOwner("Mertcan", "Koçak", "53535333", "Ankara", arabalar[0]));
  }

  Widget ArabaYapici(BuildContext ctx, int index) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(arabalar[index])));
        },
        child: Hero(
          tag: arabalar[index],
          child: Card(
              margin: EdgeInsets.all(8),
              elevation: 2.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Container(
                          height: 120,
                          width: 120,
                          padding: EdgeInsets.all(16),
                          child: FittedBox(
                              child: Image.asset(
                            arabalar[index].resim,
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
                                arabalar[index].baslik,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Aracımız " +
                                    arabalar[index].kisi.toString() +
                                    " kişiliktir.",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                arabalar[index].aciklama,
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
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Color.fromRGBO(187, 121, 237, 0.8),
      ),drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(187, 121, 237, 0.6),
                ),
                accountName: Text("Mertcan", style: TextStyle(fontSize: 20),),
                accountEmail: Text("kocakmertcan0@gmail.com" , style: TextStyle(fontSize: 16),),
                currentAccountPicture: Icon(Icons.supervised_user_circle ),
              ),
              ListTile(
                title: Text("Hakkımda"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserPage(context)));
                },
              ),
              ListTile(
                title: Text("Ayarlar"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserPage(context)));
                },
              ),
              ListTile(
                title: Text("Çıkış Yap"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserPage(context)));
                },
              ),
            ],
          ),
        ),
      body: Center(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: arabalar.length,
              itemBuilder: (context, index) => ArabaYapici(context, index),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
