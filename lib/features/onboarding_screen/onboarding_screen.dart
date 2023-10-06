import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel{
  String image;
  String title;
  String body;
  BoardingModel({
  required this.image,
    required this.title,
    required this.body,
});
}
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //const OnBoardingScreen({Key? key}) : super(key: key);
  var boardController=PageController();

List<BoardingModel>boarding=[
  BoardingModel(
      image: AssetsManager.cat1,
      title: 'On Boarding 1 Title',
      body: 'On Boarding 1 Body'),
  BoardingModel(
      image: AssetsManager.cat2,
      title: 'On Boarding 2 Title',
      body: 'On Boarding 2 Body'),
  BoardingModel(
      image: AssetsManager.cat3,
      title: 'On Boarding 3 Title',
      body: 'On Boarding 3 Body')
];
bool islast=false;
void subMite(){
// NavigateAndFinish(context, ShopLogin());
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if(index==boarding.length-1){
                    islast=true;
                  }
                  else {
                    islast=false;
                  }
                },
                itemBuilder:(context,index)=>buildBoardItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40.0,),
            Row(
              children: [
                SmoothPageIndicator(
                controller: boardController,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0
                    ),
                    count: boarding.length),
                const Spacer(),
                FloatingActionButton(onPressed: (){
                  if(islast){
                    subMite();
                  }
                  else{
                    boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 700,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),)
              ],
            )
          ],
        ),
      )


    );
  }

  Widget buildBoardItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image:AssetImage(model.image)
        ),
      ),
      //SizedBox(height: 30.0,),
      Text(
        model.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      const SizedBox(height: 15.0,),
      Text(
        model.body,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),


    ],
  );
}
