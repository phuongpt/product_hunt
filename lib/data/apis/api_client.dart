import 'package:graphql/client.dart';
import 'package:product_hunt/core/constants/keys.dart';
import 'package:product_hunt/data/apis/queries/queries.dart' as queries;
import 'package:product_hunt/data/models/models.dart';

class ApiClient {
  const ApiClient({required GraphQLClient graphQLClient}) : _graphQLClient = graphQLClient;

  factory ApiClient.create() {
    final httpLink = HttpLink('https://api.producthunt.com/v2/api/graphql');
    final authLink = AuthLink(
      getToken: () async => 'Bearer $productHuntToken',
    );
    final link = authLink.concat(httpLink);

    return ApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<FetchPostsResult> fetchPosts({required String pageIndex, required int itemsPerPage}) async {
    final variables = <String, dynamic>{'after': pageIndex, 'first': itemsPerPage};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getPosts), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchPostsResult.fromJson(result.data);
  }

  Future<FetchPostsResult> fetchPostsByTopic({required String topicSlug, required String pageIndex, required int itemsPerPage}) async {
    final variables = <String, dynamic>{'topicSlug': topicSlug, 'after': pageIndex, 'first': itemsPerPage};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getPostsByTopic), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchPostsResult.fromJson(result.data);
  }

  Future<FetchPostDetailResult> fetchPostDetail(String slug) async {
    final variables = <String, dynamic>{'slug': slug};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getPostDetail), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchPostDetailResult.fromJson(result.data);
  }

  //Topic
  Future<FetchTopicsResult> getTrendingTopics() async {
    final variables = <String, dynamic>{};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getTrendingTopics), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchTopicsResult.fromJson(result.data);
  }

  Future<FetchTopicsResult> getPopularTopics() async {
    final variables = <String, dynamic>{};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getPopularTopics), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchTopicsResult.fromJson(result.data);
  }

  Future<void> updateFollowingTopic({required String topicId, required bool follow}) async {}

  Future<SearchTopicsResult> searchTopics({required String searchTerm, required String pageIndex, required int itemsPerPage}) async {
    final variables = <String, dynamic>{'searchTerm': searchTerm, 'after': pageIndex, 'first': itemsPerPage};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.searchTopics), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return SearchTopicsResult.fromJson(result.data);
  }

  Future<FetchTopicDetailResult> fetchTopicDetail(String slug) async {
    final variables = <String, dynamic>{'slug': slug};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getTopicDetail), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchTopicDetailResult.fromJson(result.data);
  }

  //Collection
  Future<FetchCollectionsResult> fetchCollections({required String pageIndex, required int itemsPerPage}) async {
    final variables = <String, dynamic>{'after': pageIndex, 'first': itemsPerPage};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getCollections), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchCollectionsResult.fromJson(result.data);
  }

  Future<FetchCollectionDetailResult> fetchCollectionDetail(String id) async {
    final variables = <String, dynamic>{'id': id};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getCollectionDetail), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchCollectionDetailResult.fromJson(result.data);
  }

  Future<void> updateFollowingCollection({required String collectionId, required bool follow}) async {}
}
