import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  // Загрузка изображения в Firebase Storage
  static Future<String> uploadImage(String filePath, String fileName) async {
    try {
      final ref = _storage.ref().child('images/$fileName');
      final uploadTask = ref.putFile(File(filePath));
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      print('Изображение успешно загружено: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      print('Ошибка загрузки изображения: $e');
      throw Exception('Не удалось загрузить изображение: $e');
    }
  }

  // Получение URL изображения
  static Future<String> getImageUrl(String fileName) async {
    try {
      final ref = _storage.ref().child('images/$fileName');
      final url = await ref.getDownloadURL();
      print('URL изображения получен: $url');
      return url;
    } catch (e) {
      print('Ошибка получения URL изображения: $e');
      throw Exception('Не удалось получить URL изображения: $e');
    }
  }
}