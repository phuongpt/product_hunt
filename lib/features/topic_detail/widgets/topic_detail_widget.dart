import 'package:flutter/material.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/models.dart';

import 'package:styled_widget/styled_widget.dart';

class TopicDetailWidget extends StatelessWidget {
  const TopicDetailWidget({super.key, required this.item});
  final Topic item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopicDetailHeader(item: item),
        ],
      ),
    );
  }
}

class TopicDetailHeader extends StatelessWidget {
  const TopicDetailHeader({super.key, required this.item});

  final Topic item;

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: ListTile(
        title: Text(item.name, style: TextStyles.defaultStyle.fontTitle),
        subtitle: Styled.widget(
          child: Text(
            item.description,
            style: TextStyles.defaultStyle.fontSubTitle.subTitleColor,
          ),
        ).padding(top: kMinPadding),
      ),
    ).padding(vertical: kMinPadding).backgroundColor(ColorPalette.backgroundColor);
  }
}
