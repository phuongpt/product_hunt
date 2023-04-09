class Media {
  Media.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String;
    type = json['type'] as String;
    videoUrl = json['videoUrl'] as String?;
  }
  late final String url;
  late final String type;
  late final String? videoUrl;
}
