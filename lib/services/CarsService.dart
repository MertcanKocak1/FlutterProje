import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/services/StorageService.dart';
import 'dart:io';
import 'cars.dart';
import 'package:path/path.dart';

class CarsService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaurl = "";

  //veri ekleme fonksiyonu
  Future<void> addCar(String baslik , String kiraliyanKisi , int kisiSayisi ,String sehir , String aciklama ,
      PickedFile pickedFile , String fiyat) async{
    var ref = _firestore.collection("Arabalar");
    if(pickedFile == null){
      mediaurl = '';
    }else{
      mediaurl = await _storageService.uploadMedia(File(pickedFile.path));
    }

    var documentRef = await ref.add({
      'baslik' : baslik,
      'sehir' : sehir,
      'kiraliyanKisi' : kiraliyanKisi,
      'kisiSayisi' : kisiSayisi,
      'aciklama' : aciklama,
      'resim' : mediaurl,
      'fiyat' : fiyat
    });

    return Cars(id : documentRef.id,baslik: baslik , kiraliyanKisi: kiraliyanKisi
        , kisiSayisi: kisiSayisi, sehir: sehir, aciklama: aciklama, resim: mediaurl, fiyat: fiyat );
  }
  Stream<QuerySnapshot> getCars(){
    var ref = _firestore.collection("Arabalar").snapshots();
    return ref;
  }
  Stream<QuerySnapshot> getUserCars(String kisi) {
    Stream veri = _firestore.collection("Arabalar").where("kiraliyanKisi" , isEqualTo: "mert@gmail.com").snapshots();
    return veri;
  }
}