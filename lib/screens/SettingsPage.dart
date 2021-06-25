
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/appBar.dart';
import 'package:proje/Components/drawerComponent.dart';

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
      appBar: appBar("Hakkında"),
      drawer: drawerComponent(context),
    );
  }
}