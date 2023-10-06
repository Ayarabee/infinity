import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';

class LevelStack extends StatelessWidget {
  const LevelStack({super.key, required this.image, required this.num, required this.title, required this.color});
  final String image;
  final String num;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: 3*pi/4,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[600]!),
                    value: Random().nextDouble(),
                    strokeWidth: 60,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: color,
                  backgroundImage: AssetImage(image,),
                  // child: Image.asset(),
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AssetsManager.crown,height: 25,),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(num,style: const TextStyle(
                    color: Colors.black,
                  ),),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title,style: StyleManager.textStyle18.copyWith(
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
  }
}
