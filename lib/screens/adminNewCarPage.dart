import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/appBar.dart';
import 'package:proje/Components/drawerComponent.dart';
import 'package:proje/services/CarsService.dart';
import 'package:proje/services/auth.dart';
import 'package:image_picker/image_picker.dart';
class NewCar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewCarState();
  }
}

class _NewCarState extends State {
  final email = AuthService().currentUser();
  String _chosenValue;
  int _chosenValue2;
  CarsService _carsService = CarsService();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _MaxPersonController = TextEditingController();
  TextEditingController _ExplanationController = TextEditingController();
  TextEditingController _PriceController = TextEditingController();
  TextEditingController _PictureController = TextEditingController();
  TextEditingController _HeaderController = TextEditingController();
  String dropdownValue = 'Ankara';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
        appBar: appBar("Araç Ekle"),
    drawer: drawerComponent(context),
    body : buildBody(),
    ));}


  Widget buildBody(){
      return Center(
        child : Container(
          height: 500,
          width: 250,
          child : Column(
            children: [
              buildHeader(),

              buildExplanation(),
              buildPrice(),
              buildPicture(),
              buildMaxPerson(),
              buildCity(),
              buildSaveButton(),

            ],
          )
        )
      );
  }
  buildHeader() {
    return TextField(
      controller: _HeaderController,
      decoration: InputDecoration(
        icon: Icon(Icons.image),
        border: OutlineInputBorder(),
        labelText: "Başlık Ekle",
      ),
    );
  }
  buildCity() {
    return DropdownButton<String>(value : _chosenValue,style: TextStyle(color: Colors.black),
      items: <String>['Ankara' , 'İstanbul' , 'İzmir' , 'Konya'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
        hint: Text(
          "Lütfen Şehir Seçiniz",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        onChanged: (String value) {
          setState(() {
            _chosenValue = value;
          });
        });
  }
  buildMaxPerson() {
    return DropdownButton<int>(
        hint: Text("Maksimum Kişi Sayısı"),
        value: _chosenValue2,
        items: <int>[1, 2, 3, 4].map((int value) {
          return new DropdownMenuItem<int>(
            value: value,
            child: new Text(value.toString()),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            _chosenValue2 = newVal;
          });
        });
  }

  buildExplanation() {
    return TextField(
      controller: _ExplanationController,
      decoration: InputDecoration(
        icon: Icon(Icons.message),
        border: OutlineInputBorder(),
        labelText: "Açıklama",
      ),
    );
  }

  buildPrice() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: _PriceController,
      decoration: InputDecoration(
        icon: Icon(Icons.all_inclusive_rounded),
        border: OutlineInputBorder(),
        labelText: "Günlük Ücret",
      ),
    );
  }

  buildPicture() {
    return TextField(
      controller: _PictureController,
      decoration: InputDecoration(
        icon: Icon(Icons.image),
        border: OutlineInputBorder(),
        labelText: "Resim Ekle",
      ),
    );
  }
  buildSaveButton() {
    return InkWell(onTap: (){
      _carsService.addCar(_HeaderController.text, email, _chosenValue2, _chosenValue,
          _ExplanationController.text, _PictureController.text,_PriceController.text);
    }
    , child: Text("Araç Ekle"));
  }
}


