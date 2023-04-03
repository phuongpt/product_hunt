class ImageUrl {
  String? s50px;
  String? s88px;
  String? s176px;
  String? s88px2X;
  String? s88px3X;
  String? original;

  ImageUrl({
    this.s50px,
    this.s88px,
    this.s176px,
    this.s88px2X,
    this.s88px3X,
    this.original,
  });

  ImageUrl.fromJson(Map<String, dynamic> json) {
    s50px = json['50px'];
    s88px = json['88px'];
    s176px = json['176px'];
    s88px2X = json['88px@2X'];
    s88px3X = json['88px@3X'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['50px'] = s50px;
    data['88px'] = s88px;
    data['176px'] = s176px;
    data['88px@2X'] = s88px2X;
    data['88px@3X'] = s88px3X;
    data['original'] = original;
    return data;
  }
}

class ScreenshotUrl {
  String? s300px;
  String? s850px;

  ScreenshotUrl({this.s300px, this.s850px});

  ScreenshotUrl.fromJson(Map<String, dynamic> json) {
    s300px = json['300px'];
    s850px = json['850px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['300px'] = s300px;
    data['850px'] = s850px;
    return data;
  }
}

class Thumbnail {
  Thumbnail({
    required this.id,
    required this.mediaType,
    required this.imageUrl,
  });
  late final String id;
  late final String mediaType;
  late final String imageUrl;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['media_type'] = mediaType;
    data['image_url'] = imageUrl;
    return data;
  }
}
