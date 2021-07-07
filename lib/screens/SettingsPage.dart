import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/Components/appBar.dart';
import 'package:proje/Components/drawerComponent.dart';
import 'dart:io';
import 'package:proje/services/auth.dart';

import 'homePage.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State {
  AuthService _authService = AuthService();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_authService.currentUser()),
      drawer: drawerComponent(context),
      body: buildBody(),
    );
  }

  buildBody() {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        child: Column(
          children: [
            buildInfo(),
            buildPassword(),
            buildPassword2(),
            buildUpdatePasswordButton()
          ],
        ),
      ),
    );
  }

  buildInfo() {
    return Text("Şifre Sıfırlama", style: TextStyle(fontSize: 22));
  }

  buildPassword() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Şifreniz",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }

  buildPassword2() {
    return TextField(
      controller: _passwordController2,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Şifreniz Tekrar",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }

  buildUpdatePasswordButton() {
    return ElevatedButton(
        onPressed: () {
          if (_passwordController.text != _passwordController2.text) {
            Fluttertoast.showToast(
                msg: "Şifreler Eşleşmiyor!",
                timeInSecForIosWeb: 2,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[600],
                textColor: Colors.white,
                fontSize: 14);
          } else {
            _authService.chancePassword(_passwordController.text);
            Fluttertoast.showToast(
                msg: "Şifre başarı ile değiştirildi!",
                timeInSecForIosWeb: 2,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[600],
                textColor: Colors.white,
                fontSize: 14);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()));
          }
        },
        child: Text("Şifre Değiştir"));
  }
}
