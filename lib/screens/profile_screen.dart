import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../models/user_model.dart';
import '../screens/auth_screen.dart';
class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _professionController;
  late TextEditingController _bioController;
  late TextEditingController _genderController; // Замена Dropdown на TextField
  late TextEditingController _maritalStatusController; // Замена Dropdown на TextField

  // Состояния для проверки валидности полей
  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isAddressValid = true;
  bool _isCityValid = true;
  bool _isProfessionValid = true;
  bool _isBioValid = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _professionController = TextEditingController();
    _bioController = TextEditingController();
    _genderController = TextEditingController(); // Инициализация нового контроллера
    _maritalStatusController = TextEditingController(); // Инициализация нового контроллера

    _loadUserData(); // Загружаем данные при инициализации
  }

  Future<void> _loadUserData() async {
    try {
      final userData = await DatabaseService.getUser(widget.userId);
      if (userData != null) {
        setState(() {
          _nameController.text = userData['displayName'] ?? '';
          _emailController.text = userData['email'] ?? '';
          _addressController.text = userData['address'] ?? '';
          _cityController.text = userData['city'] ?? '';
          _professionController.text = userData['profession'] ?? '';
          _bioController.text = userData['bio'] ?? '';
          _genderController.text = userData['gender'] ?? ''; // Загрузка данных для пола
          _maritalStatusController.text = userData['maritalStatus'] ?? ''; // Загрузка данных для семейного положения
        });
      }
    } catch (e) {
      print('Ошибка загрузки данных пользователя: $e');
    }
  }

  bool _validateFields() {
    setState(() {
      _isNameValid = _nameController.text.trim().isNotEmpty;
      _isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_emailController.text.trim());
      _isAddressValid = _addressController.text.trim().isNotEmpty;
      _isCityValid = _cityController.text.trim().isNotEmpty;
      _isProfessionValid = _professionController.text.trim().isNotEmpty;
      _isBioValid = _bioController.text.trim().length <= 500; // Максимальная длина биографии — 500 символов
    });

    return _isNameValid && _isEmailValid && _isAddressValid && _isCityValid && _isProfessionValid && _isBioValid;
  }

  Future<void> _updateProfile() async {
    if (!_validateFields()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Пожалуйста, исправьте ошибки в форме')));
      return;
    }

    try {
      await DatabaseService.updateUser(widget.userId, {
        'displayName': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'address': _addressController.text.trim(),
        'city': _cityController.text.trim(),
        'profession': _professionController.text.trim(),
        'bio': _bioController.text.trim(),
        'gender': _genderController.text.trim(), // Сохранение данных для пола
        'maritalStatus': _maritalStatusController.text.trim(), // Сохранение данных для семейного положения
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Профиль обновлен')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка обновления профиля: $e')));
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Выход из аккаунта
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()), // Переход на экран входа
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка выхода из аккаунта: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Поле для имени
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Имя',
                  errorText: _isNameValid ? null : 'Поле не может быть пустым',
                ),
              ),
              SizedBox(height: 16),

              // Поле для email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _isEmailValid ? null : 'Введите корректный рабочий email',
                ),
                enabled: true
                , // Email нельзя редактировать
              ),
              SizedBox(height: 16),

              // Поле для адреса
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Адрес',
                  errorText: _isAddressValid ? null : 'Поле не может быть пустым',
                ),
              ),
              SizedBox(height: 16),

              // Поле для города
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Город',
                  errorText: _isCityValid ? null : 'Поле не может быть пустым',
                ),
              ),
              SizedBox(height: 16),

              // Поле для профессии
              TextField(
                controller: _professionController,
                decoration: InputDecoration(
                  labelText: 'Профессия',
                  errorText: _isProfessionValid ? null : 'Поле не может быть пустым',
                ),
              ),
              SizedBox(height: 16),

              // Поле для описания
              TextField(
                controller: _bioController,
                decoration: InputDecoration(
                  labelText: 'Описание',
                  errorText: _isBioValid ? null : 'Максимальная длина — 500 символов',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),

              // Поле для пола (заменено на TextField)
              TextField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Пол'),
              ),
              SizedBox(height: 16),

              // Поле для семейного положения (заменено на TextField)
              TextField(
                controller: _maritalStatusController,
                decoration: InputDecoration(labelText: 'Семейное положение'),
              ),
              SizedBox(height: 16),

              // Кнопка сохранения изменений
              ElevatedButton(
                onPressed: _updateProfile,
                child: Text('Сохранить изменения'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _professionController.dispose();
    _bioController.dispose();
    _genderController.dispose(); // Освобождение ресурсов
    _maritalStatusController.dispose(); // Освобождение ресурсов
    super.dispose();
  }
}