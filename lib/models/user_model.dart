import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? birthDate;
  final String? bio;

  UserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.birthDate,
    this.bio,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'birthDate': birthDate,
      'bio': bio,
    };
  }
}