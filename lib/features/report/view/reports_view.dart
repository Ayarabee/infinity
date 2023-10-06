import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_comp_app/core/core_widgets/default_appbar.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';
import 'package:nasa_comp_app/features/questions/presentation/views/questions_view.dart';
import 'package:nasa_comp_app/features/report/models/report_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key, required this.model});
final ReportModel model;

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: const DefaultAppBar(title: "Articles",),
        body: Column(
          children: [
            const SizedBox(height: 15,),
            CarouselSlider.builder(
              itemCount: widget.model.images!.length,
              itemBuilder: (context, index, realIndex) {
                final image = widget.model.images![index];
                return buildImage3(widget.model.images!, index);
              },
              options: CarouselOptions(
                height: 280,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayInterval: const Duration(seconds: 4),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: buildIndicator(widget.model.images!),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: ColorsManager.white ,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width-40,
                  child: Text(
                    widget.model.article!,
                    maxLines: 100,
                    style: StyleManager.textStyle15.copyWith(
                      color: ColorsManager.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton:Container(
          width: 130,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorsManager.blue,
          ),
          child: InkWell(
            onTap: (){
              Get.to(()=>const QuestionsView(),transition:Transition.fadeIn );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Questions",style: StyleManager.textStyle15.copyWith(
                  color: ColorsManager.white,
                ),),
                const SizedBox(width: 10,),
                Lottie.asset(AssetsManager.arrowRight,width: 30,height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
  buildImage3(List<String> images, int index,) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30)),
    child: Image.asset(
      images[index % images.length],
      fit: BoxFit.cover,
    ),
  );

  buildIndicator(List<String> images) => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: images.length,
    effect: const JumpingDotEffect(
      dotHeight: 15,
      dotWidth: 15,
      activeDotColor: ColorsManager.blue,
      dotColor: Colors.black12,
    ),
  );
}
