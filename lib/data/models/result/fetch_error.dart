class FetchError implements Exception {
  FetchError({required this.message});

  factory FetchError.fromJson(Map<String, dynamic> json) {
    return FetchError(
      message: json['message'] as String,
    );
  }

  final String message;
}
