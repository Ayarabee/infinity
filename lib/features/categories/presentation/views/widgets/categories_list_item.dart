import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/size_manager.dart';
import 'package:nasa_comp_app/features/home/presentation/cubit/home_cubit.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key, required this.title, required this.image, required this.route, required this.animation, required this.animation2});
  final String title;
  final String image;
  final Widget route;
  final Animation<double> animation;
  final Animation<double> animation2;
  @override
  Widget build(BuildContext context) {
    SizeManager.init(context);
    return Opacity(
      opacity: animation.value,
      child: Transform.translate(
        offset: Offset(0, animation2.value),
        child: Container(
          height: SizeManager.screenWidth/ 2.3,
          width:SizeManager.screenWidth,
          padding: EdgeInsets.fromLTRB(SizeManager.screenWidth / 20, 0, SizeManager.screenWidth / 20, SizeManager.screenWidth / 20),
          child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              HomeCubit.get(context).changeLevelPage(true);
              HapticFeedback.lightImpact();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ColorsManager.blue.withOpacity(.2),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
              child: Padding(
                padding: EdgeInsets.all(SizeManager.screenWidth / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeManager.screenWidth / 3,
                      width: SizeManager.screenWidth / 3,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill,),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(width: SizeManager.screenWidth / 40),
                    SizedBox(
                      width: SizeManager.screenWidth / 2.05,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsManager.black.withOpacity(.7),
                              fontSize: SizeManager.screenWidth / 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            'Tap to know more',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorsManager.secondaryDark3,
                              fontSize: SizeManager.screenWidth / 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  },
),
        ),
      ),
    );
  }
}
