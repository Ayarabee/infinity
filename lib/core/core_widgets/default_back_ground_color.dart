import 'package:flutter/material.dart';

class DefaultBackgroundColor extends StatelessWidget {
  const DefaultBackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [

              Color(0xffF9B1D0),
              Color(0xffE8B8E0),
              Color(0xffED92EF),
              Color(0xffB09EFF),
              Color(0xff7DDFFF),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
      ),
    );
  }
}
