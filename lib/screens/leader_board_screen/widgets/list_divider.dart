import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {
  const ListDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.grey.withOpacity(.4),
    );
  }
}
