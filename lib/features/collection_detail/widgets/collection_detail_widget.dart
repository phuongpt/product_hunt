import 'package:flutter/material.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/extensions/extensions.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/features/collection_detail/widgets/widgets.dart';
import 'package:styled_widget/styled_widget.dart';

class CollectionDetailWidget extends StatelessWidget {
  const CollectionDetailWidget({super.key, required this.item});
  final Collection item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CollectionDetailHeader(item: item),
          CollectionDetailPostsWidget(
            items: item.posts,
          )
        ],
      ),
    );
  }
}

class CollectionDetailHeader extends StatelessWidget {
  const CollectionDetailHeader({super.key, required this.item});

  final Collection item;

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: ListTile(
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
