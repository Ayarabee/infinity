import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_comp_app/core/core_widgets/default_appbar.dart';
import 'package:nasa_comp_app/core/core_widgets/default_bottom_nav_bar.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/features/home/presentation/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key,this.levels, });
final int? levels;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: ColorsManager.white,
          appBar: DefaultAppBar(title:HomeCubit.get(context).isLevels?"Levels": cubit.pagesName[cubit.navBarIndex],),
          //HomeCubit.get(context).isLevels?LevelsView(levels: levels??0,):
          body:cubit.pages[cubit.navBarIndex],
          floatingActionButton: cubit.navBarIndex==2?SizedBox(
            height: 40,
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 66, 53)),
                onPressed: () {},
                child:Text("Post")),
          ):SizedBox(),
          bottomNavigationBar: const DefaultBottomNavBar(),
        );
      },
    ));
  }
}

