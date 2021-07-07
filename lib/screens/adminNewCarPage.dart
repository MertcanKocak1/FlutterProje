import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/appBar.dart';
import 'package:proje/Components/drawerComponent.dart';
import 'package:proje/services/CarsService.dart';
import 'package:proje/services/StorageService.dart';
import 'package:proje/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'homePage.dart';

class NewCar extends StatefulWidget {
  _NewCarState createState() => _NewCarState();
}

class _NewCarState extends State {
  // ignore: top_level_instance_method
  final email = AuthService().currentUser();
  String _chosenValue;
  int _chosenValue2;
  CarsService _carsService = CarsService();
  TextEditingController _ExplanationController = TextEditingController();
  TextEditingController _PriceController = TextEditingController();
  TextEditingController _HeaderController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  dynamic _pickImage;
  PickedFile pickedFile;
  File _image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: appBar("Araç Ekle"),
      drawer: drawerComponent(context),
      body: buildBody(),
    ));
  }

  Widget buildBody() {
    return Center(
        child: Container(
            height: 500,
            width: 250,
            child: Column(
              children: [
                buildHeader(),
                buildExplanation(),
                buildPrice(),
                buildMaxPerson(),
                buildCity(),
                buildPicture(),
                buildSaveButton(),
              ],
            )));
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
    return DropdownButton<String>(
        value: _chosenValue,
        style: TextStyle(color: Colors.black),
        items: <String>['Ankara', 'İstanbul', 'İzmir', 'Konya']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          "Lütfen Şehir Seçiniz",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
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
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
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
    return InkWell(
        onTap: () => _onImageButtonPressed(),
        child: Row(
          children: [
            Icon(
              Icons.image,
              size: 30,
              color: Colors.blue,
            ),
            Text("Resim Seçiniz ")
          ],
        ));
  }

  buildSaveButton() {
    return InkWell(
      onTap: () {
        _carsService
            .addCar(_HeaderController.text, email, _chosenValue2, _chosenValue,
                _ExplanationController.text, pickedFile, _PriceController.text)
            .then((value) {
          Fluttertoast.showToast(
              msg: "Durum eklendi!",
              timeInSecForIosWeb: 2,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey[600],
              textColor: Colors.white,
              fontSize: 14);
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()));
        });
      },
      child: Text("Araç Ekle"),
    );
  }

  Future _onImageButtonPressed() async {
    pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
