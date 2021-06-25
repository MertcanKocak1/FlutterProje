import 'package:cloud_firestore/cloud_firestore.dart';

import 'cars.dart';


class CarsService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //veri ekleme fonksiyonu

  Future<void> addCar(String baslik , String kiraliyanKisi , int kisiSayisi ,String sehir , String aciklama , String resim , String fiyat) async{
    var ref = _firestore.collection("Arabalar");
    resim = "resim" ;
    var documentRef = await ref.add({
      'baslik' : baslik,
      'sehir' : sehir,
      'kiraliyanKisi' : kiraliyanKisi,
      'kisiSayisi' : kisiSayisi,
      'aciklama' : aciklama,
      'resim' : resim,
      'fiyat' : fiyat
    });

    return Cars(id : documentRef.id,baslik: baslik , kiraliyanKisi: kiraliyanKisi
        , kisiSayisi: kisiSayisi, sehir: sehir, aciklama: aciklama, resim: resim, fiyat: fiyat );
  }
}