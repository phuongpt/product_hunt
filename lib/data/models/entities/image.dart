class Thumbnail {
  Thumbnail({
    required this.url,
  });

  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String;
  }
  late final String url;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
