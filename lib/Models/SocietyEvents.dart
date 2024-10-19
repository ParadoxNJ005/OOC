class SocietyEve {
  String description;
  String venue;
  String form;
  String image;
  // String name;
  String date;

  SocietyEve({
    this.description = '', // Default to an empty string if no value is provided
    this.venue = '',
    this.form = '',
    this.image = '',
    // this.name='',
    this.date = '',
  });

  factory SocietyEve.fromJson(Map<String, dynamic> json) {
    return SocietyEve(
      description: json["Description"] ?? '', // Handle null values with default empty string
      venue: json["Venue"] ?? '',
      form: json["form"] ?? '',
      image: json["Image"] ?? '',
      // name:json["title"] ?? '',
      date: json["Date"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Description": description,
      "Venue": venue,
      "form": form,
      "Image": image,
      // "Name": name,
      "Date": date,
    };
  }
}
