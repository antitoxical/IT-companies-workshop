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

  factory ItemModel.fromMap(Map<String, dynamic> map, String id) {
    return ItemModel(
      id: id,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
    };
  }
}