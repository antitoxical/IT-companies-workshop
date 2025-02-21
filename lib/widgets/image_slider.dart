import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;

  const ImageSlider({required this.images});

  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? Center(child: Text('Нет изображений'))
        : PageView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250,
        );
      },
    );
  }
}