import 'package:flutter/material.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/features/topic_detail/topic_detail.dart';

class TopicDetailWidget extends StatelessWidget {
  const TopicDetailWidget({super.key, required this.item});
  final Topic item;

  @override
  Widget build(BuildContext context) {
    return TopicDetailPostWidget(topicSlug: item.slug, header: TopicDetailHeader(item: item));
  }
}
