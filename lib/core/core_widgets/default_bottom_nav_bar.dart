import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/features/home/presentation/cubit/home_cubit.dart';

class DefaultBottomNavBar extends StatefulWidget {
  const DefaultBottomNavBar({super.key});

  @override
  State<DefaultBottomNavBar> createState() => _DefaultBottomNavBarState();
}

class _DefaultBottomNavBarState extends State<DefaultBottomNavBar> {
  final items = [
    const Icon(Icons.category_outlined, size: 30),
    const Icon(Icons.grid_view_outlined, size: 30),
    const Icon(Icons.add_circle, size: 30),
    const Icon(Icons.more_vert_outlined, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Theme(
          // this them is for to change icon colors.
          data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                color: Colors.white,
              )),
          child: CurvedNavigationBar(
            // navigationBar color
            color: ColorsManager.blue.withOpacity(.9),
            //selected times colors
            buttonBackgroundColor: ColorsManager.primary.withOpacity(.7),
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            items: items,
            height: 60,
            index: HomeCubit.get(context).navBarIndex,
            onTap: (index) {
              HomeCubit.get(context).changeNavBarIndex(index);
              HomeCubit.get(context).changeLevelPage(false);
            },
          ),
        );
      },
    );
  }
}
