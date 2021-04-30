import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiralama"),
        backgroundColor: Color.fromRGBO(187, 121, 237, 0.8),
      ),
      body: buildBody(),
    );
  }
}

Widget buildBody() {
  return Center(
    child: Container(
      width: 300,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildUserNameField(),
          buildEmailField(),
          buildPasswordField(),
          buildRePasswordField(),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {},
            child: Text("Kayıt Ol"),
          )
        ],
      ),
    ),
  );
}

buildUserNameField() {
  return TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.person),
      border: OutlineInputBorder(),
      labelText: "Kullanıcı Adınız",
    ),
  );
}

Widget buildEmailField() {
  return TextFormField(
    decoration: InputDecoration(
        labelText: "Mail",
        icon: Icon(Icons.email),
        border: OutlineInputBorder()),
  );
}

Widget buildPasswordField() {
  return TextFormField(
    decoration: InputDecoration(
        labelText: "Şifreniz",
        icon: Icon(Icons.lock),
        border: OutlineInputBorder()),
    obscureText: true,
  );
}

Widget buildRePasswordField() {
  return TextFormField(
    decoration: InputDecoration(
        labelText: "Şifreniz",
        icon: Icon(Icons.lock),
        border: OutlineInputBorder()),
    obscureText: true,
  );
}
