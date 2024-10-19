class Artists {
  String desc; // Non-nullable
  String venue;
  String reels;
  String image;
  String day;
  String name;

  Artists({
    this.desc = '',   // Provide default values
    this.venue = '',
    this.reels = '',
    this.image = '',
    this.day = '',
    this.name = '',
  });

  Artists.fromJson(Map<String, dynamic> json)
      : desc = json["Desc"] ?? '', // Use null-aware operators
        venue = json["Venue"] ?? '',
        reels = json["Reels"] ?? '',
        image = json["Image"] ?? '',
        day = json["Day"] ?? '',
        name = json["Name"] ?? '';

  Map<String, dynamic> toJson() {
    return {
      "Desc": desc,
      "Venue": venue,
      "Reels": reels,
      "Image": image,
      "Day": day,
      "Name": name,
    };
  }
}
