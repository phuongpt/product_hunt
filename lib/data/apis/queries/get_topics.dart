String getPopularTopics = '''
    query GetPopularTopics() {
      topics(order: FOLLOWERS_COUNT, first:5) {
        edges{
            node {
            id,name,followersCount,image,isFollowing,postsCount,slug,description
          }
        }
      }
    }
  ''';

String getTrendingTopics = '''
    query GetTrendingTopics() {
      topics(order: NEWEST, first:5) {
        edges{
            node {
            id,name,followersCount,image,isFollowing,postsCount,slug,description
          }
        }
      }
    }
  ''';
