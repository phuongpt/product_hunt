import 'package:graphql/client.dart';

class FetchError implements Exception {
  FetchError({required this.message});

  factory FetchError.fromJson(Map<String, dynamic> json) {
    return FetchError(
      message: json['message'] as String,
    );
  }

  factory FetchError.exception(OperationException? exception) {
    final formatException = exception?.linkException?.originalException as FormatException?;
    return FetchError(
      message: formatException != null ? formatException.message : 'Something wrong!',
    );
  }

  final String message;
}
