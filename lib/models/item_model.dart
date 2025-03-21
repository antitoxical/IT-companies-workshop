class ItemModel {
  final String id;
  final String name;
  final String description;
  final List<String> images;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
  });

  // Преобразование из Map
  factory ItemModel.fromMap(Map<String, dynamic> map) {
    try {
      return ItemModel(
        id: map['id'] as String? ?? '', // Если поле отсутствует, используем пустую строку
        name: map['name'] as String? ?? 'Без имени',
        description: map['description'] as String? ?? 'Нет описания',
        images: List<String>.from(map['images'] ?? []), // Пустой список по умолчанию
      );
    } catch (e) {
      throw FormatException('Ошибка при парсинге данных: $e');
    }
  }

  // Преобразование в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
    };
  }
}