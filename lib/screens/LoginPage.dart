import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proje/Components/appBar.dart';
import 'file:///C:/Users/inuxe/AndroidStudioProjects/proje/lib/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUpPage.dart';
import 'homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}
enum authProblems { UserNotFound, PasswordNotValid, NetworkError }
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: appBar("Giriş Yap"),
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
        ],
      ),
    ));
  }

  buildUserNameField() {
    return TextField(controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        border: OutlineInputBorder(),
        labelText: "Kullanıcı Adınız",
      ),
    );
  }

  buildPasswordField() {
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

  buildLoginButton() {
    // ignore: deprecated_member_use
    return ElevatedButton(
      onPressed: () {
        try{
        _authService
            .signIn(
            _emailController.text, _passwordController.text)
            .then((value) {
          return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()));
        });
        }
        on FirebaseAuthException catch (e) {
          print(e.code);
    }
    },
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
