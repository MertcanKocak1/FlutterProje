import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Cars{
  String id;
  String baslik;
  String kiraliyanKisi ;
  int kisiSayisi;
  String sehir ;
  String aciklama;
  String resim;
  String fiyat;
  Cars({this.id, this.baslik , this.kiraliyanKisi , this.kisiSayisi , this.sehir , this.aciklama,this.resim ,this.fiyat});

  factory Cars.fromSnapshot(DocumentSnapshot snapshot){
    return Cars(
      id : snapshot.id,
      baslik: snapshot['baslik'],
      kiraliyanKisi: snapshot['kiraliyanKisi'],
      kisiSayisi: snapshot['kisiSayisi'],
      sehir : snapshot['sehir'],
      aciklama: snapshot['aciklama'],
      resim : snapshot['resim'],
      fiyat : snapshot['fiyat']
    );
  }

}