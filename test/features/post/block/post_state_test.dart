// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/features/post/post.dart';

void main() {
  group('StatsState', () {
    PostState createSubject({
      PostStatus status = PostStatus.initial,
      List<Post> items = const <Post>[],
      bool hasNextPage = true,
      String nextPageIndex = '',
      int itemsPerPage = 10,
    }) {
      return PostState(
        status: status,
        items: items,
        hasNextPage: hasNextPage,
        nextPageIndex: nextPageIndex,
        itemsPerPage: itemsPerPage,
      );
    }

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            status: null,
            items: null,
            hasNextPage: null,
            nextPageIndex: null,
            itemsPerPage: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            status: PostStatus.success,
            items: [],
            hasNextPage: false,
            nextPageIndex: 'false',
            itemsPerPage: 10,
          ),
          equals(
            createSubject(
              status: PostStatus.success,
              items: [],
              hasNextPage: false,
              nextPageIndex: 'false',
              itemsPerPage: 10,
            ),
          ),
        );
      });
    });
  });
}
