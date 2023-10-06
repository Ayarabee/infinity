import 'package:flutter/material.dart';

class ThreeLevelsRow extends StatelessWidget {
  const ThreeLevelsRow({super.key, required this.level1, required this.level2, required this.level3});
 final Widget level1;
  final Widget level2;
  final Widget level3;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        level1,
        const SizedBox(width: 15,),
        level2,
        const SizedBox(width: 15,),
        level3,
      ],
    );
  }
}
