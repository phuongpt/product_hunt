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

  Future<FetchPostsResult> fetchPosts(String pageIndex, int itemsPerPage) async {
    final variables = <String, dynamic>{'after': pageIndex, 'first': itemsPerPage};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getPosts), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchPostsResult.fromJson(result.data);
  }

  Future<FetchPostDetailResult> fetchPostDetail(String id) async {
    final variables = <String, dynamic>{'id': id};

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getPostDetail), variables: variables),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchPostDetailResult.fromJson(result.data);
  }

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
}
