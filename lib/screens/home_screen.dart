import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../models/item_model.dart';
import '../widgets/item_card.dart';
import 'detail_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;

  HomeScreen({required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ItemModel>> _itemsFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _itemsFuture = DatabaseService.getItems(); // Загружаем элементы при инициализации
  }

  // Фильтрация объектов по названию
  List<ItemModel> _filterItems(List<ItemModel> items) {
    if (_searchQuery.isEmpty) return items;
    return items.where((item) => item.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  // Добавление объекта в избранное
  Future<void> _addToFavorites(ItemModel item) async {
    try {
      await DatabaseService.addToFavorites(widget.userId, item);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Добавлено в избранное')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка добавления в избранное: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Поиск по названию...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: TextStyle(color: Colors.black),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color:Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesScreen(userId: widget.userId)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen(userId: widget.userId)),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ItemModel>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка загрузки данных: ${snapshot.error}'));
          }
          final items = _filterItems(snapshot.data ?? []);
          if (items.isEmpty) {
            return Center(child: Text('Ничего не найдено'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ItemCard(
                item: item,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailScreen(item: item, userId: widget.userId)),
                  );
                },
                onFavoriteTap: () => _addToFavorites(item),
              );
            },
          );
        },
      ),
    );
  }
}