import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        Text("Empty List".tr())
      ],),
    );
  }
}
