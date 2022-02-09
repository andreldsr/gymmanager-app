class Exercise {
  String? name;
  String? image;
  String? video;
  String? description;
  int? repetitions;
  int? series;

  Exercise(
      {required this.name,
      required this.image,
      required this.video,
      required this.description,
      required this.repetitions,
      required this.series});

  Exercise.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'] ?? "";
    description = json['description'] ?? "";
    repetitions = json['repetitions'] ?? "";
    series = json['series'] ?? "";
    video = "";
  }
}
