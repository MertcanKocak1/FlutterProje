import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/appBar.dart';
import 'file:///C:/Users/inuxe/AndroidStudioProjects/proje/lib/services/auth.dart';
import 'package:proje/screens/LoginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
  
}
class _SignUpPageState extends State<SignUpPage>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBar("Kayıt Ol"),
      body: buildBody(),
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
            buildEmailField(),
            buildPasswordField(),
            buildRePasswordField(),
            buildRegisterButton()
          ],
        ),
      ),
    );
  }

  Widget buildUserNameField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        border: OutlineInputBorder(),
        labelText: "Kullanıcı Adınız",
      ),
    );
  }

  Widget buildEmailField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Mail",
          icon: Icon(Icons.email),
          border: OutlineInputBorder()),
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: "Şifreniz",
          icon: Icon(Icons.lock),
          border: OutlineInputBorder()),
      obscureText: true,
    );
  }

  Widget buildRePasswordField() {
    return TextFormField(
      controller: _passwordAgainController,
      decoration: InputDecoration(
          labelText: "Şifreniz",
          icon: Icon(Icons.lock),
          border: OutlineInputBorder()),
      obscureText: true,
    );
  }

  Widget buildRegisterButton() {
    return ElevatedButton(onPressed: () {
      _authService
          .createPerson(
          _usernameController.text,
          _emailController.text,
          _passwordController.text)
          .then((value) {
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()));
      });}
    , child: Text("Kayıt Ol"));
  }
}
