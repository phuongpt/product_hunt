import 'package:faker/faker.dart';
import 'package:product_hunt/data/models/models.dart';

class FakePost {
  static Post generate() {
    final faker = Faker();

    return Post(
      id: faker.guid.guid(),
      name: faker.lorem.sentence(),
      tagline: faker.lorem.sentence(),
      slug: faker.lorem.word(),
      votesCount: faker.randomGenerator.integer(100),
      featuredAt: faker.date.dateTime(),
      thumbnail: Thumbnail(
        url: faker.image.image(),
      ),
      description: faker.lorem.sentence(),
      topics: List.generate(
        faker.randomGenerator.integer(5),
        (index) => Topic(
          id: faker.guid.guid(),
          name: faker.lorem.sentence(),
          slug: faker.lorem.word(),
          description: faker.lorem.sentence(),
          followersCount: faker.randomGenerator.integer(100),
          followersCountString: '',
          image: faker.image.image(),
          isFollowing: false,
          postsCount: faker.randomGenerator.integer(100),
        ),
      ),
      commentsCount: faker.randomGenerator.integer(100),
      reviewsCount: faker.randomGenerator.integer(100),
      user: User(
        id: faker.guid.guid(),
      ),
      featured: faker.randomGenerator.boolean(),
      url: faker.internet.httpsUrl(),
      website: faker.internet.domainName(),
      comments: List.generate(
        faker.randomGenerator.integer(5),
        (index) => Comment(
          id: faker.guid.guid(),
          body: faker.lorem.sentence(),
          user: User(
            id: faker.guid.guid(),
          ),
          createdAt: faker.date.dateTime(),
          replies: [],
          repliesCount: faker.randomGenerator.integer(100),
          votesCount: faker.randomGenerator.integer(100),
        ),
      ),
      media: List.generate(
        faker.randomGenerator.integer(5),
        (index) => Media(
          type: faker.randomGenerator.element(['image', 'video']),
          url: faker.image.image(),
        ),
      ),
    );
  }
}
