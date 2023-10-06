import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_comp_app/core/resources_manager/assets_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';
import 'package:nasa_comp_app/features/report/view/reports_view.dart';
import 'package:nasa_comp_app/features/video/data/model/video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.videoList});
final List<VideoModel>videoList;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late YoutubePlayerController controller;
  late String videoUrl;
  late var videoId ;
  Future<YoutubePlayerController> fetchVideoData() async {
    videoUrl="https://youtu.be/TT9H-ubwaio?si=WXpzuQMksbuVi9d0";
    videoId= YoutubePlayer.convertUrlToId(videoUrl);
    controller= YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),);
    return controller;
  }
  void changeAndPlayVideo(String newVideoId) {
    setState(() {
      videoId = newVideoId;
     controller.load(newVideoId);
     controller.play();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.blue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<YoutubePlayerController>(
              future: fetchVideoData(), // The Future to monitor
              builder: (BuildContext context, AsyncSnapshot<YoutubePlayerController> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while the future is running.
                  return const CircularProgressIndicator(color: ColorsManager.white,);
                } else if (snapshot.hasError) {
                  // Display an error message if the future encounters an error.
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display the fetched data when the future completes successfully.
                  return  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: YoutubePlayer(
                          controller: controller,
                          showVideoProgressIndicator: true,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(
                              isExpanded: true,
                              colors: const ProgressBarColors(
                                playedColor: ColorsManager.blue,
                                handleColor: ColorsManager.blue,
                              ),
                            ),
                            const PlaybackSpeedButton(),
                          ],
                        ),
                      ),
                      Align(
                        alignment:Alignment.topLeft,
                        child: IconButton(
                          onPressed: (){
                            Get.back();
                          }
                          , icon: const Icon(Icons.arrow_circle_left,color: Colors.white,size: 30,),),
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 40.0),
              child: Text("Videos :",style: StyleManager.textStyle24.copyWith(
                color: ColorsManager.white,
                fontWeight: FontWeight.w600
              ),),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50).copyWith(
                    bottom: 15,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>InkWell(
                      onTap: (){
                        print(widget.videoList[index].video!);
                        setState(() {
                          videoId=YoutubePlayer.convertUrlToId(widget.videoList[index].video!);
                          changeAndPlayVideo(videoId);
                        });

                        // controller.play();
                      },
                      child: Row(
                        children: [
                          Container(
                            height:70,
                            width: 70,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image:  DecorationImage(
                                  image: AssetImage(
                                    widget.videoList[index].image!,
                                  ),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Center(
                            child: Text( widget.videoList[index].title!,style: StyleManager.textStyle18.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.blue,
                            ),),
                          )
                        ],
                      ),
                    ),
                    separatorBuilder: (context,index)=>const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(
                        height: 2,
                        color: ColorsManager.secondaryDark2,
                      ),
                    ),
                    itemCount:  widget.videoList.length,
                  ),
                ))
          ],
        ),
        floatingActionButton: Container(
          width: 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorsManager.blue,
          ),
          child: InkWell(
            onTap: (){
              Get.to(()=>ReportView(model: widget.videoList[0].reports![0],),transition:Transition.fadeIn );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("articles",style: StyleManager.textStyle15.copyWith(
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
}
