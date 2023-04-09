String getCollections = r'''
    query getCollections($first: Int, $after: String) {
      collections(order: FOLLOWERS_COUNT, first: $first, after: $after) {
        pageInfo {
          hasNextPage
          endCursor
        }
        edges {
          node {
              id
              name
              tagline
              description
              coverImage
              followersCount
              isFollowing
              url
            }
        }
      }
    }
  ''';

String getCollectionDetail = r'''
    query getCollectionDetail($id: ID) {
       collection(id: $id) {
        id
        name
        tagline
        description
        coverImage
        followersCount
        isFollowing
        url
        posts(first: 10) {
          edges {
            node {
              id
              name
              tagline
              slug
              votesCount
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
    }
  ''';
