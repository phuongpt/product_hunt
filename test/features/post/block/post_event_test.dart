// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:product_hunt/features/post/post.dart';

void main() {
  group('PostEvent', () {
    group('PostFetched', () {
      test('supports value equality', () {
        expect(
          PostFetched(),
          equals(PostFetched()),
        );
      });

      test('props are correct', () {
        expect(
          PostFetched().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}
