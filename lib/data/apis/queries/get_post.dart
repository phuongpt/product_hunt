String getPost = r'''
    query GetPost($id: ID!) {
       post(id: $id) {
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
