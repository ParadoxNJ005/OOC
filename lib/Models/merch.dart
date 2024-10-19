class Merch {
  String description; // Nullable fields should have a default value or be required
  String price;
  String front;
  String back;
  String name;

  Merch({
    this.description = '', // Provide a default value
    this.price = '',
    this.front = '',
    this.back = '',
    this.name = '',
  });

  Merch.fromJson(Map<String, dynamic> json)
      : description = json["Description"] ?? '', // Use null-aware operators
        price = json["Price"] ?? '',
        front = json["Front"] ?? '',
        back = json["Back"] ?? '',
        name = json["Name"] ?? '';

  Map<String, dynamic> toJson() {
    return {
      "Description": description,
      "Price": price,
      "Front": front,
      "Back": back,
      "Name": name,
    };
  }
}
