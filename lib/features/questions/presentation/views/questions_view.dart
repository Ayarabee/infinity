import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';
import 'package:nasa_comp_app/features/questions/data/questions_data.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int currentAnswer=-1;
  int currentIndex=0;
  int currentIndex1=1;
  int currentIndex2=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorsManager.blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.white,
          ),
        ),
        title: Text(
          "Questions",
          style: StyleManager.textStyle20.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              color: ColorsManager.white,
            ),
            child: ListView.separated(
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questionsList[index].question!,
                          style: StyleManager.textStyle18.copyWith(
                            color: ColorsManager.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, answer) => InkWell(
                              onTap: (){
                                setState(() {
                                  currentAnswer=answer;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: currentIndex==index&&currentAnswer==answer?ColorsManager.blue:ColorsManager.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: ColorsManager.blue)),
                                child: Text(
                                  questionsList[index].answers![answer],
                                  style: StyleManager.textStyle13.copyWith(
                                    color: currentIndex==index&&currentAnswer
                                        ==answer?ColorsManager.white:ColorsManager.black,
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 20,
                            ),
                            itemCount: questionsList[index].answers!.length,
                          ),
                        )
                      ],
                    ),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                        color: ColorsManager.secondaryDark2,
                      ),
                ),
                itemCount: questionsList.length),
          ))
        ],
      ),
    );
  }
}
