import 'package:flutter/material.dart';
import 'widgets/post_card.dart';
import 'widgets/profile_story_card.dart';
import 'widgets/story_card.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    var storyData = [
      {
        'imageUrl':
        'https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b',
        'userName': 'aya5alied',
      },
      {
        'imageUrl':
        'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'ayarabee',
      },
      {
        'imageUrl':
        'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'esraa',
      },
      {
        'imageUrl':
        'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'aliaa',
      },
      {
        'imageUrl':
        'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'amira',
      },
    ];

    var postData = [
      {
        'imageUrl':
        'https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b',
        'userName': 'aya5alied',
        "profileImage":
        "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
      },
      {
        'imageUrl':
        'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'esraa',
        "profileImage":
        "https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr"
      },
      {
        'imageUrl':
        'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'aya5alied',
        "profileImage":
        "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
      },
      {
        'imageUrl':
        'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'esraa',
        "profileImage":
        "https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr"
      },
      {
        'imageUrl':
        'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
        'userName': 'aya5alied',
        "profileImage":
        "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
      },
    ];

    var likeImagesList = [
      'https://www.freepik.com/free-vector/tap-drop-save-water-save-life-hand-drawn-sketch-vector-illustration_29886769.htm#query=water%20problems&position=44&from_view=search&track=ais',
      'https://www.freepik.com/free-vector/save-water-ecology-concept-with-drop-water-coming-out-tap-realistic_14662201.htm#query=water%20problems&position=0&from_view=search&track=ais',
      'https://www.freepik.com/free-vector/flat-world-water-day-infographic-template_22282784.htm#query=water%20problems&position=12&from_view=search&track=ais',
      'https://www.freepik.com/free-vector/water-drop-concept-illustration_22881214.htm#page=2&query=water%20problems&position=4&from_view=search&track=ais',
    ];
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProfileStoryCard(),
                  ListView.builder(
                      itemCount: storyData.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return StoryCard(
                          profileImage: storyData[index]['imageUrl']!,
                          userName: storyData[index]['userName']!,
                        );
                      })
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: postData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: PostCard(
                      likeImagesList: likeImagesList,
                      postData: postData[index],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
