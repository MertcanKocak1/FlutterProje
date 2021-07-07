import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'CarsService.dart';
import 'package:proje/screens/adminNewCarPage.dart';
import 'package:path/path.dart';
class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //resim eklemek için
  Future<String> uploadMedia(File file) async {
    String filename = basename(file.path);
    Reference storageReference = FirebaseStorage.instance.ref().child("${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}");
    final UploadTask uploadTask = storageReference.putFile(file);
    final TaskSnapshot downloadUrl = (await uploadTask);
    return await downloadUrl.ref.getDownloadURL();
  }


}