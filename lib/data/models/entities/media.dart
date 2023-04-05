class Media {
  Media({
    required this.id,
    required this.priority,
    required this.originalWidth,
    required this.originalHeight,
    required this.imageUrl,
    required this.mediaType,
  });

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    priority = json['priority'] as int;
    originalWidth = json['original_width'] as int;
    originalHeight = json['original_height'] as int;
    imageUrl = json['image_url'] as String;
    mediaType = json['media_type'] as String;
  }
  late final int id;
  late final int priority;
  late final int originalWidth;
  late final int originalHeight;
  late final String imageUrl;
  late final String mediaType;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['priority'] = priority;
    data['original_width'] = originalWidth;
    data['original_height'] = originalHeight;
    data['image_url'] = imageUrl;
    data['media_type'] = mediaType;
    return data;
  }
}
