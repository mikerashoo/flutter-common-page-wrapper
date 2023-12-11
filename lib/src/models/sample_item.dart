// sample_item.dart

class SampleItem {
  final int id;
  final String title;
  final String description;

  SampleItem({
    required this.id,
    required this.title,
    required this.description,
  });

  factory SampleItem.fromJson(Map<String, dynamic> json) {
    return SampleItem(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
