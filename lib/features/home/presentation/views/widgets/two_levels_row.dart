import 'package:flutter/material.dart';

class TwoLevelsRow extends StatelessWidget {
  const TwoLevelsRow({super.key, required this.level1, required this.level2});
 final Widget level1;
  final Widget level2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        level1,
        const SizedBox(width: 20,),
        level2,
      ],
    );
  }
}
