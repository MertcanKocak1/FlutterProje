
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _SettingsPageState();
  }

}

class _SettingsPageState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hakkında"),
          backgroundColor: Color.fromRGBO(187, 121, 237, 0.8),
        ));
  }
}