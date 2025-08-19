class ApiModel {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ApiModel(this.status, this.totalResults, this.articles);

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      json['status'],
      json['totalResults'],
      (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e))
          .toList(),
    );
  }
}

class Article {
  final String title;
  final String? description;
  final String? urlToImage;
  final String publishedAt;
  final String? author;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      author: json['author'],
    );
  }
}
