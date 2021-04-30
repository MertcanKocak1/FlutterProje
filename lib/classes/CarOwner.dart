import 'package:proje/Components/Arabalar.dart';

import 'User.dart';

class CarOwner extends User{
  final Araba araba;
  static List<Araba> sahipArabalar = List<Araba>();
  CarOwner(String isim, String soyisim, String telefon, String sehir, this.araba) : super(isim, soyisim, telefon, sehir){
      sahipArabalar.add(this.araba);
  }
  araclariAl(){
    return sahipArabalar;
  }
}