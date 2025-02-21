import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  // Загрузка изображения в Firebase Storage
  static Future<String> uploadImage(String filePath, String fileName) async {
    final ref = _storage.ref().child('images/$fileName');
    final uploadTask = ref.putFile(File(filePath));
    final snapshot = await uploadTask.whenComplete(() {});
    return await snapshot.ref.getDownloadURL();
  }

  // Получение URL изображения
  static Future<String> getImageUrl(String fileName) async {
    final ref = _storage.ref().child('images/$fileName');
    return await ref.getDownloadURL();
  }
}