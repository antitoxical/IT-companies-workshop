import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item_model.dart';
import '../models/user_model.dart';

class DatabaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Добавление пользователя в Firestore
  static Future<void> addUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toMap());
      print('Пользователь успешно добавлен');
    } catch (e) {
      print('Ошибка добавления пользователя: $e');
    }
  }

  // Получение данных пользователя
  static Future<Map<String, dynamic>?> getUser(String userId) async {
    try {
      final doc = await _db.collection('users').doc(userId).get();
      return doc.data();
    } catch (e) {
      print('Ошибка загрузки данных пользователя: $e');
      return null;
    }
  }

  // Обновление данных пользователя
  static Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    try {
      await _db.collection('users').doc(userId).set(data, SetOptions(merge: true));
      print('Данные пользователя успешно обновлены');
    } catch (e) {
      print('Ошибка обновления данных пользователя: $e');
      throw Exception('Не удалось обновить данные пользователя: $e');
    }
  }

  // Проверка, находится ли элемент в избранном
  static Future<bool> isFavorite(String userId, String itemId) async {
    try {
      final snapshot = await _db
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(itemId)
          .get();

      return snapshot.exists;
    } catch (e) {
      print('Ошибка проверки избранного: $e');
      return false;
    }
  }

  // Добавление элемента в избранное
  static Future<void> addToFavorites(String userId, ItemModel item) async {
    if (userId.isEmpty || item.id.isEmpty) {
      throw Exception('Ошибка: userId или itemId не определены');
    }

    try {
      await _db
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(item.id)
          .set(item.toMap());
      print('Элемент успешно добавлен в избранное');
    } catch (e) {
      print('Ошибка добавления в избранное: $e');
      throw Exception('Не удалось добавить элемент в избранное: $e');
    }
  }

  // Удаление элемента из избранного
  static Future<void> removeFromFavorites(String userId, String itemId) async {
    try {
      await _db
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(itemId)
          .delete();
      print('Элемент успешно удален из избранного');
    } catch (e) {
      print('Ошибка удаления из избранного: $e');
    }
  }

  // Получение списка объектов
  static Future<List<ItemModel>> getItems() async {
    try {
      final querySnapshot = await _db.collection('items').get();
      return querySnapshot.docs
          .where((doc) => doc.data() != null) // Фильтруем документы с непустыми данными
          .map((doc) => ItemModel.fromMap(doc.data()!)) // Преобразуем данные в модель
          .toList();
    } catch (e) {
      print('Ошибка загрузки элементов: $e');
      return [];
    }
  }

  // Получение избранных объектов
  static Future<List<ItemModel>> getFavorites(String userId) async {
    try {
      final snapshot = await _db
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .get();

      return snapshot.docs
          .where((doc) => doc.data() != null) // Фильтруем документы с непустыми данными
          .map((doc) => ItemModel.fromMap(doc.data()!)) // Преобразуем данные в модель
          .toList();
    } catch (e) {
      print('Ошибка загрузки избранного: $e');
      return [];
    }
  }

  // Поток для избранных объектов
  static Stream<List<ItemModel>> getFavoritesStream(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .snapshots()
        .map((snapshot) {
      try {
        return snapshot.docs
            .where((doc) => doc.data() != null) // Фильтруем документы с непустыми данными
            .map((doc) => ItemModel.fromMap(doc.data()!)) // Преобразуем данные в модель
            .toList();
      } catch (e) {
        print('Ошибка загрузки избранного: $e');
        return [];
      }
    });
  }
}