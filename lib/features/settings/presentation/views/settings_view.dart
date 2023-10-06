import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String>swotList=[
    AssetsManager.swot1,
    AssetsManager.swot2,
    AssetsManager.swot3,
    AssetsManager.swot4,
  ];
  List<String>gpmList=[
    AssetsManager.gpm,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0),
         child: Text("swot (Surface Water and Ocean Topography",style: StyleManager.textStyle15.copyWith(
           color: ColorsManager.blue,
         ),),
       ),
        const SizedBox(height: 15,),
        CarouselSlider.builder(
          itemCount: swotList.length,
          itemBuilder: (context, index, realIndex) {
            final image = swotList[index];
            return buildImage3(swotList, index);
          },
          options: CarouselOptions(
            height: 280,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayInterval: const Duration(seconds: 4),
          ),
        ),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width-30,
            child: Text(
              "SWOT will use a radar interferometer to measure the height of water surfaces with unprecedented accuracy. It will also measure the width of rivers and lakes, providing valuable information about their flow rates and volumes. By combining these measurements with data from other satellites, SWOT will create high-resolution maps of Earth's surface water features.The mission is expected to improve our understanding of how water moves and is stored on Earth's surface, which is crucial for managing water resources, predicting floods and droughts, and studying the impacts of climate change. SWOT data will also be used to improve weather forecasting models, ocean circulation models, and climate models.",
              maxLines: 100,
              style: StyleManager.textStyle15.copyWith(
                color: ColorsManager.black,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
          child: Divider(
            color: Colors.black38,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text("GPM(Global Precipitation Measurement",style: StyleManager.textStyle15.copyWith(
            color: ColorsManager.blue,
          ),),
        ),
        const SizedBox(height: 15,),
        CarouselSlider.builder(
          itemCount: gpmList.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage3(gpmList, index);
          },
          options: CarouselOptions(
            height: 280,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayInterval: const Duration(seconds: 4),
          ),
        ),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width-30,
            child: Text(
              "GPM provides global precipitation measurements with improved accuracy, coverage and dynamic range for studying precipitation characteristics. GPM also improves weather and precipitation forecasts through assimilation of instantaneous brightness temperatures and retrieved precipitation information. Relative to TRMM, the enhanced measurement and sampling capabilities of GPM offer many advanced science contributions and societal ",
              maxLines: 100,
              style: StyleManager.textStyle15.copyWith(
                color: ColorsManager.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text("benefits:",style: StyleManager.textStyle18.copyWith(
            color: ColorsManager.blue,
          ),),
        ),
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width-30,
            child: Text(
              "Improved knowledge of the Earth’s water cycle and its link to climate change New insights into storm structures and large-scale atmospheric processes New insights into precipitation microphysics Advanced understanding of climate sensitivity and feedback processes Extended capabilities in monitoring and predicting tropical cyclones and other extreme weather events Improved forecasting abilities for natural hazards, including floods, droughts and landslides. Enhanced numerical weather prediction skills Improved agricultural crop forecasting and monitoring of freshwater resources",
              maxLines: 100,
              style: StyleManager.textStyle15.copyWith(
                color: ColorsManager.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
  buildImage3(List<String> images, int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.blue,
        borderRadius: BorderRadius.circular(30)),
    child: Image.asset(
      images[index % images.length],
      fit: BoxFit.fill,
    ),
  );
}
