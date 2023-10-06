import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DefaultAppBar({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: ClipRRect(
        borderRadius:const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        child: AppBar(
          backgroundColor: ColorsManager.blue.withOpacity(.9),
          elevation: 0.0,
          title: Text(title,style: StyleManager.textStyle20.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.w400,
          ),),
          actions: [
            Row(
              children: [
                Lottie.asset(AssetsManager.animatedCrown,width: 40,height: 40),
                const SizedBox(width: 3,),
                Text("3",style:StyleManager.textStyle18.copyWith(
                  color: ColorsManager.white
                ),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Lottie.asset(AssetsManager.coins,width: 40,height: 40),
                  const SizedBox(width: 3,),
                  Text("100",style:StyleManager.textStyle18.copyWith(
                    color: ColorsManager.white
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
