import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:nasa_comp_app/features/home/presentation/views/home_view.dart';
import 'package:nasa_comp_app/features/home/presentation/views/levels_view.dart';
import 'package:nasa_comp_app/features/report/models/report_model.dart';
import 'package:nasa_comp_app/features/video/data/model/video_model.dart';
import 'package:nasa_comp_app/features/video/presentation/views/video_view.dart';

import 'categories_model.dart';

List<CategoriesModel> catList = [
  CategoriesModel(
      "Understanding Water Problem",
      AssetsManager.cat1,
      1,
      VideoPlayerView(
        videoList: [
          VideoModel(
            AssetsManager.l1V1,
            "first problem we have",
            "https://youtu.be/TT9H-ubwaio?si=WXpzuQMksbuVi9d0",
            [
              ReportModel(
                "You know that planet Earth is a very special planet because we have very large quantities of water, distributed throughout the oceans and ends and even in the atmosphere. We have about 370 quantillion gallons of water but you know that we do not use all of this amount of water, but only about 0.01, and of course this is such a small percentage of The amount we have is why in the future we may suffer from a scarcity of this water. That is why we need to conserve water and I have chosen ways to save this water. In order to know how we will preserve and save water, we need to know what the water cycle is and how this water is distributed and where it is distributed and consumed. That is, such as agriculture, drinking, and so on, and what factors affect them, especially climate",
                [
                  AssetsManager.repo1,
                  AssetsManager.repo2,
                ],
              )
            ]
          ),
          VideoModel(
            AssetsManager.l1V1,
            "seconds problem we have",
            "https://youtu.be/TT9H-ubwaio?si=WXpzuQMksbuVi9d0",
            [
              ReportModel(
                "You know that planet Earth is a very special planet because we have very large quantities of water, distributed throughout the oceans and ends and even in the atmosphere. We have about 370 quantillion gallons of water but you know that we do not use all of this amount of water, but only about 0.01, and of course this is such a small percentage of The amount we have is why in the future we may suffer from a scarcity of this water. That is why we need to conserve water and I have chosen ways to save this water. In order to know how we will preserve and save water, we need to know what the water cycle is and how this water is distributed and where it is distributed and consumed. That is, such as agriculture, drinking, and so on, and what factors affect them, especially climate",
                [
                  AssetsManager.repo1,
                  AssetsManager.repo2,
                ],
              )
            ]
          ),
          VideoModel(
            AssetsManager.l1V1,
            "third problem we have",
            "https://youtu.be/TT9H-ubwaio?si=WXpzuQMksbuVi9d0",
              [
                ReportModel(
                  "You know that planet Earth is a very special planet because we have very large quantities of water, distributed throughout the oceans and ends and even in the atmosphere. We have about 370 quantillion gallons of water but you know that we do not use all of this amount of water, but only about 0.01, and of course this is such a small percentage of The amount we have is why in the future we may suffer from a scarcity of this water. That is why we need to conserve water and I have chosen ways to save this water. In order to know how we will preserve and save water, we need to know what the water cycle is and how this water is distributed and where it is distributed and consumed. That is, such as agriculture, drinking, and so on, and what factors affect them, especially climate",
                  [
                    AssetsManager.repo1,
                    AssetsManager.repo2,
                  ],
                )
              ]
          ),
        ],
      ),
  ),
  CategoriesModel(
      "Where is the water on Earth",
      AssetsManager.cat2,
      5,
      const LevelsView(
        levels: 5,
      )),
  CategoriesModel(
      "Water cycle",
      AssetsManager.cat3,
      1,
      const HomeView(
        levels: 6,
      )),
  CategoriesModel("How Climate Change Impacts Water Access",AssetsManager.cat4,6,const HomeView(levels: 6,)),
];
