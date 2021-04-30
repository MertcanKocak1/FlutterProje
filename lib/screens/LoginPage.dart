import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUpPage.dart';
import 'homePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kiralama Uygulaması"),
          backgroundColor: Color.fromRGBO(187, 121, 237, 0.8),
        ),
        body: buildBody(),
      ),
    );
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
          buildPasswordField(),
          buildLoginButton(),
          buildGoSignUpPage(),
          GestureDetector(
            child: Text("git"),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage1()));
      },
    )
        ],
      ),
    ));
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

  buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Şifreniz",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }

  buildLoginButton() {
    // ignore: deprecated_member_use
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Giriş Yap"), Icon(Icons.login)],
      ),
    );
  }

  buildGoSignUpPage() {
    return GestureDetector(
      child: Text("Kayıt Ol"),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
    );
  }
}
