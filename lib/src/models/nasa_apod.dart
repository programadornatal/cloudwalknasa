class NasaApod {
  final String date;
  final String title;
  final String explanation;
  final String url;

  NasaApod(
      {required this.date,
      required this.title,
      required this.explanation,
      required this.url});

  factory NasaApod.fromJson(Map<String, dynamic> json) {
    return NasaApod(
      date: json['date'],
      title: json['title'],
      explanation: json['explanation'],
      url: json['url'],
    );
  }
}
