String getPosts = r'''
    query GetPosts($first: Int, $after: String) {
      posts(order: RANKING, first: $first, after: $after) {
        pageInfo {
          hasNextPage
          endCursor
        }
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
