import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../models/user_model.dart';
import 'auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userData = await DatabaseService.getUser(widget.userId);
    if (userData != null) {
      setState(() {
        _nameController.text = userData['displayName'] ?? '';
        _birthDateController.text = userData['birthDate'] ?? '';
        _bioController.text = userData['bio'] ?? '';
      });
    }
  }

  Future<void> _updateProfile() async {
    await DatabaseService.updateUser(widget.userId, {
      'displayName': _nameController.text.trim(),
      'birthDate': _birthDateController.text.trim(),
      'bio': _bioController.text.trim(),
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Профиль обновлен')));
  }

  Future<void> _signOut(BuildContext context) async {
    await AuthService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Имя')),
            TextField(controller: _birthDateController, decoration: InputDecoration(labelText: 'Дата рождения')),
            TextField(controller: _bioController, decoration: InputDecoration(labelText: 'Описание'), maxLines: 3),
            ElevatedButton(onPressed: _updateProfile, child: Text('Сохранить изменения')),
            ElevatedButton(onPressed: () => _signOut(context), child: Text('Выйти из системы')),
          ],
        ),
      ),
    );
  }
}