import 'package:flutter/material.dart';
import 'package:product_hunt/core/constants/sizing.dart';
import 'package:product_hunt/core/constants/text_style.dart';
import 'package:styled_widget/styled_widget.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Styled.text(
      title,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: TextStyles.defaultStyle.fontHeader.bold,
    ).padding(bottom: kMaxPadding, horizontal: kDefaultPadding, top: kDefaultPadding);
  }
}
