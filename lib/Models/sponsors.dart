class Sponsors {
  final String image;
  final String name;

  Sponsors({
    required this.image,
    required this.name,
  });

  factory Sponsors.fromMap(Map<String, dynamic> map) {
    return Sponsors(
      image: map['image'] ?? '', // Default to an empty string if image is null
      name: map['name'] ?? '',   // Default to an empty string if name is null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }
}
