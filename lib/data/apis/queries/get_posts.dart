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

String getPostDetail = r'''
    query GetPostDetail($id: ID!) {
       post(id: $id) {
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
        comments(first: 10) {
          edges {
            node {
              id
              body
              createdAt
              votesCount
              replies {
                totalCount
                edges{
                  node{
                    id
                    body
                    createdAt
                    votesCount
                  }
                }
              }
            }
          }
        }
      }
    }
  ''';
