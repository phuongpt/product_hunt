class InstallLinks {
  InstallLinks({
    required this.id,
    required this.postId,
    required this.createdAt,
    required this.primaryLink,
    required this.websiteName,
    required this.redirectUrl,
  });

  InstallLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    postId = json['post_id'] as String;
    createdAt = json['created_at'] as String;
    primaryLink = json['primary_link'] as bool;
    websiteName = json['website_name'] as String;
    redirectUrl = json['redirect_url'] as String;
  }
  late final String id;
  late final String postId;
  late final String createdAt;
  late final bool primaryLink;
  late final String websiteName;
  late final String redirectUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['created_at'] = createdAt;
    data['primary_link'] = primaryLink;
    data['website_name'] = websiteName;
    data['redirect_url'] = redirectUrl;
    return data;
  }
}
