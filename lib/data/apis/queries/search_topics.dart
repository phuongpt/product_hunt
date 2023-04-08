const searchTopics = r'''
   query searchTopics($searchTerm: String $first: Int, $after: String) {
      topics(order: FOLLOWERS_COUNT, query: $searchTerm, first: $first, after: $after) {
        pageInfo {
          hasNextPage
          endCursor
        }
        edges {
          node {
               id,name,followersCount,image,isFollowing,postsCount,slug,description
            }
        }
      }
    }
''';
