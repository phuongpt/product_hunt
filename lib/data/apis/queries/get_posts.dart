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
    query GetPostDetail($slug: String) {
       post(slug: $slug) {
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

String getPostsByTopic = r'''
  query getPostsByTopic($topicSlug: String!, $first: Int!, $after: String) {
    posts(topic: $topicSlug, first: $first, after: $after) {
      pageInfo {
        endCursor
        hasNextPage
      }
      edges {
        cursor
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
