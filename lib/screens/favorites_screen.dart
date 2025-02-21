import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../models/item_model.dart';
import 'detail_screen.dart';
class FavoritesScreen extends StatelessWidget {
  final String userId;
  FavoritesScreen({required this.userId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Избранное')),
      body: FutureBuilder<List<ItemModel>>(
        future: DatabaseService.getFavorites(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка загрузки данных'));
          }
          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return Center(child: Text('В избранном ничего нет'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailScreen(item: item)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
