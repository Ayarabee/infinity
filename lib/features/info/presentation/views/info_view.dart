import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Not finished yet",
            textAlign: TextAlign.center,
            style: StyleManager.textStyle20.copyWith(
                color: ColorsManager.black.withOpacity(.7)
            ),),
        )
      ],
    );
  }
}
