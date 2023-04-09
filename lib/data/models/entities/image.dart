class Thumbnail {
  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String;
  }
  late final String url;
}
