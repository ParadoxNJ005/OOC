class Events {
  String date; // Non-nullable
  String image;
  String venue;
  String des;
  String title;

  Events({
    this.date = '',   // Provide default values
    this.image = '',
    this.venue = '',
    this.des = '',
    this.title = '',
  });

  Events.fromJson(Map<String, dynamic> json)
      : date = json["date"] ?? '', // Use null-aware operators
        image = json["image"] ?? '',
        venue = json["venue"] ?? '',
        des = json["des"] ?? '',
        title = json["title"] ?? '';

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "image": image,
      "venue": venue,
      "des": des,
      "title": title,
    };
  }
}
