import 'package:graphql/client.dart';
import 'package:product_hunt/core/constants/keys.dart';
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

  Future<FetchPostsResult> fetchPosts() async {
    const query = '''
      query {
        posts(order:RANKING,first:10) {
          edges {
            node {
              id
              name
              tagline
              slug
              votesCount
              createdAt
              featuredAt
              thumbnail {
                url
              }
              reviewsCount
              commentsCount
              topics {
                edges {
                  node {
                    name
                    slug
                    id
                  }
                }
              }
              user {
                headline
                id,
                name
              }
              description
              media{
                url
                type
                videoUrl
              }
            }
          }
        }
      }
    ''';

    final result = await _graphQLClient.query(
      QueryOptions(document: gql(query)),
    );
    if (result.hasException) throw FetchError.exception(result.exception);
    return FetchPostsResult.fromJson(result.data);
  }

  Future<FetchPostResult> fetchPost(String postId) async {
    return FetchPostResult(post: null);
  }

  Future<FetchTopicsResult> fetchTopics() async {
    return FetchTopicsResult(topics: []);
  }
}
