class Film {
  final String title;
  final String director;
  final String description;
  final String producer;
  final String releasedate;
  final String created;
  final String edited;

  Film({
    required this.title,
    required this.director,
    required this.description,
    required this.releasedate,
    required this.edited,
    required this.created,
    required this.producer,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      edited: json['edited'],
      created: json['created'],
      director: json['director'],
      description: json['opening_crawl'],
      releasedate: json['release_date'],
      producer: json['producer'],
    );
  }
}
