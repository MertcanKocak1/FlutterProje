
/*Widget build(BuildContext context) {
  // TODO: implement build
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Color.fromRGBO(187, 121, 237, 0.8),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Mertcan"),
              accountEmail: Text("accountEmail"),
              currentAccountPicture: Icon(Icons.supervised_user_circle),
            ),
            ListTile(
              title: Text("Hakkımda"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserAboutPage()));
              },
            ),
          ],
        ),
      ),
      body: buildBody(),
    ),
  );
}

Widget buildBody() {
  return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      width: double.maxFinite,
      child: Expanded(
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Text("Bla");
                  },
                  child: Hero(
                    tag : 'location${Icons.countertops}',
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.only(top: 20),
                      clipBehavior: Clip.hardEdge,
                      child: Column(children: [
                        ListTile(
                          leading: Image(
                            image: NetworkImage(
                              "https://www.otoshops.com/cms/uploads/18/20190130101037/HaberOrtacoupe-arabalar.jpg",
                            ),
                          ),
                          title: Text("Kiralık Araç"),
                          subtitle: Text("2 Kişilik"),
                        ),
                        Row(children: [
                          TextButton(
                            child: const Text('Rezervasyon Yap'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          TextButton(
                            child: const Text('Detaylar'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ])
                      ]),
                    ),
                  ));
            }),
      ));
}
}
*/

/* Widget ArabaYapici(BuildContext ctx , int index){
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(arabalar[index])));
      },
      child: Card(
          margin: EdgeInsets.all(8),
          elevation: 2.0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: arabalar[index],
                      child: Image.asset(arabalar[index].resim),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      arabalar[index].baslik,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next, color: Colors.black38),
              ],
            ),
          )),
    );
  }*/

/*Hero(
child : Container(
transitionOnUserGestures: true,
tag: araba,
child: Transform.scale(
scale: 1,
child: Image.asset(araba.resim),
),
)*/
/*
Card(
elevation: 5,
margin: EdgeInsets.all(16),
child: Container(
width: double.infinity,
padding: EdgeInsets.all(16),
child: Text(araba.aciklama),
)
),*/


/*Widget CarOwnerCars(BuildContext ctx, int index){
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(CarOwner.sahipArabalar[index])));
        },
        child: Hero(
          tag: carsList[index],
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
                                carsList[index].araba.resim,
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
                                carsList[index].araba.baslik,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Aracımız " +
                                    carsList[index].araba.kisi.toString() +
                                    " kişiliktir.",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                carsList[index].araba.aciklama,
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
  }*/

/*class _UserPageState extends State {
  List<CarOwner> carsList = CarOwner.sahipArabalar.cast<CarOwner>();
  Widget CarOwnerCars(BuildContext ctx, int index){
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(CarOwner.sahipArabalar[index])));
        },
        child: Hero(
          tag: carsList[index],
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
                                carsList[index].araba.resim,
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
                                carsList[index].araba.baslik,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Aracımız " +
                                    carsList[index].araba.kisi.toString() +
                                    " kişiliktir.",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                carsList[index].araba.aciklama,
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
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: carsList.length,
                  itemBuilder: (context, index) => CarOwnerCars(context, index),
                ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));

  }
}
*/

/*/*
class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserPageState();
  }
}
class _UserPageState extends State {
  List<CarOwner> carsList = CarOwner.sahipArabalar.cast<CarOwner>();
  Widget CarOwnerCars(BuildContext ctx, int index){
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(CarOwner.sahipArabalar[index])));
        },
        child: Hero(
          tag: carsList[index],
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
                                carsList[index].araba.resim,
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
                                carsList[index].araba.baslik,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Aracımız " +
                                    carsList[index].araba.kisi.toString() +
                                    " kişiliktir.",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                carsList[index].araba.aciklama,
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
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: carsList.length,
                  itemBuilder: (context, index) => CarOwnerCars(context, index),
                ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));

  }
}
*/*/