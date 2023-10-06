import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoBuilder extends StatelessWidget {
  const VideoBuilder({super.key, required this.fetchVideoData, required this.controller});
final Function() fetchVideoData;
final YoutubePlayerController controller;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<YoutubePlayerController>(
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
          return  AspectRatio(
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
          );
        }
      },
    );
  }
}
