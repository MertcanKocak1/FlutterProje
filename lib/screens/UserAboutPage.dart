import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Components/appBar.dart';
import 'package:proje/Components/drawerComponent.dart';
import 'package:proje/classes/CarOwner.dart';

import 'details.dart';
class UserPage extends StatefulWidget{
  UserPage(BuildContext context);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserPageState();
  }

}

class _UserPageState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBar("Kullanıcı"),
      drawer: drawerComponent(context),
    );
  }
}