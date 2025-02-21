import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item_model.dart';
import '../models/user_model.dart';

class DatabaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Добавление пользователя в Firestore
  static Future<void> addUser(UserModel user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap());
  }

  // Получение данных пользователя
  static Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.data();
  }

  // Обновление данных пользователя
  static Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _db.collection('users').doc(uid).update(data);
  }

  // Добавление объекта в избранное
  static Future<void> addToFavorites(String userId, String itemId) async {
    await _db.collection('users').doc(userId).update({
      'favorites': FieldValue.arrayUnion([itemId]),
    });
  }

  // Удаление объекта из избранного
  static Future<void> removeFromFavorites(String userId, String itemId) async {
    await _db.collection('users').doc(userId).update({
      'favorites': FieldValue.arrayRemove([itemId]),
    });
  }

  // Получение списка объектов
  static Future<List<ItemModel>> getItems() async {
    final querySnapshot = await _db.collection('items').get();
    return querySnapshot.docs.map((doc) => ItemModel.fromMap(doc.data(), doc.id)).toList();
  }

  // Получение избранных объектов
  static Future<List<ItemModel>> getFavorites(String userId) async {
    final userDoc = await _db.collection('users').doc(userId).get();
    final favoriteIds = List<String>.from(userDoc.data()?['favorites'] ?? []);
    final items = await _db.collection('items').where(FieldPath.documentId, whereIn: favoriteIds).get();
    return items.docs.map((doc) => ItemModel.fromMap(doc.data(), doc.id)).toList();
  }
}