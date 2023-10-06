import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/size_manager.dart';
import 'package:nasa_comp_app/features/categories/data/categories_data.dart';
import 'widgets/categories_list_item.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  CategoriesViewState createState() => CategoriesViewState();
}

class CategoriesViewState extends State<CategoriesView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -50).animate(CurvedAnimation(
        parent: _controller2, curve: Curves.fastLinearToSlowEaseIn));

    _controller.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeManager.init(context);
    return ListView(
      physics:
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        SizedBox(height: SizeManager.screenWidth / 5.5),
        for(int i=0;i<catList.length;i++)
        CategoriesListItem(
          title: catList[i].name!,
          image:catList[i].image!,
          route: catList[i].route!,
          animation: _animation,
          animation2: _animation2,
        ),
      ],
    );
  }
}