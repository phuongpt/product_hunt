import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListLoadingInitial extends StatelessWidget {
  const ListLoadingInitial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: const CircularProgressIndicator(),
    );
  }
}
