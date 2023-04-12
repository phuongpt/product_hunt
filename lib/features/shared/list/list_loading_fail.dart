import 'package:flutter/material.dart';
import 'package:product_hunt/core/extensions/text_style_extension.dart';

class ListLoadingFail extends StatelessWidget {
  const ListLoadingFail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Center(child: Text('Failed to fetch data!', style: TextStyles.defaultStyle)),
    );
  }
}
