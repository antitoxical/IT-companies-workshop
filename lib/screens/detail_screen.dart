import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../widgets/image_slider.dart';

class DetailScreen extends StatelessWidget {
  final ItemModel item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Column(
        children: [
          // Слайдер изображений
          Expanded(
            flex: 2,
            child: ImageSlider(images: item.images),
          ),
          // Описание объекта
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(item.description),
                ],
              ),
            ),
          ),
          // Кнопка "Добавить в избранное"
          ElevatedButton(
            onPressed: () {
              // Логика добавления в избранное
            },
            child: Text('Добавить в избранное'),
          ),
        ],
      ),
    );
  }
}