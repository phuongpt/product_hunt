class Media {
  Media({
    required this.url,
    required this.type,
    this.videoUrl,
  });

  Media.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String;
    type = json['type'] as String;
    videoUrl = json['videoUrl'] as String?;
  }
  late final String url;
  late final String type;
  late final String? videoUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    data['videoUrl'] = videoUrl;
    return data;
  }
}
