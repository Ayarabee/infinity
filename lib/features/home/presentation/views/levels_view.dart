import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/core_widgets/default_appbar.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'widgets/level_stack.dart';
import 'widgets/two_levels_row.dart';

class LevelsView extends StatelessWidget {
  const LevelsView({super.key, required this.levels});
final int levels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBar(title: "Levels"),
      body: ListView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          const SizedBox(height: 40,),
          LevelStack(image:AssetsManager.level1,num:"2",title:"Level 1",color:Colors.blue[100]!),
          const SizedBox(height: 30,),
          TwoLevelsRow(
            level1:LevelStack(image:AssetsManager.level2,num:"1",title:"Level 2",color:Colors.green[100]!),
            level2:LevelStack(image:AssetsManager.level3,num:"4",title:"Level 3",color:Colors.red[100]!),
          ),
          const SizedBox(height: 30,),
          TwoLevelsRow(
            level1:LevelStack(image:AssetsManager.level4,num:"3",title: "Level 4",color:Colors.orange[100]!),
            level2:LevelStack(image:AssetsManager.level5,num: "3",title: "Level 5",color:Colors.teal[100]!),
          ),
        ],
      ),
    );
  }
}
