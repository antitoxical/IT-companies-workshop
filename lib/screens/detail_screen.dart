import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../widgets/image_slider.dart';
import '../services/database_service.dart';

class DetailScreen extends StatefulWidget {
  final ItemModel item;
  final String userId;

  DetailScreen({required this.item, required this.userId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    try {
      final isFavorite = await DatabaseService.isFavorite(widget.userId, widget.item.id);
      setState(() {
        _isFavorite = isFavorite;
      });
    } catch (e) {
      print('Ошибка проверки избранного: $e');
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      if (_isFavorite) {
        await DatabaseService.removeFromFavorites(widget.userId, widget.item.id);
      } else {
        await DatabaseService.addToFavorites(widget.userId, widget.item);
      }
      setState(() {
        _isFavorite = !_isFavorite;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка при работе с избранным: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.name)),
      body: Column(
        children: [
          Expanded(flex: 2, child: ImageSlider(images: widget.item.images)),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.item.description),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _toggleFavorite,
            child: Text(_isFavorite ? 'Удалить из избранного' : 'Добавить в избранное'),
          ),
        ],
      ),
    );
  }
}