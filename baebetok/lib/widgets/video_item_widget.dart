import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/video_model.dart';
import '../services/video_provider.dart';
import 'video_player_widget.dart';
import 'video_actions_widget.dart';
import 'video_info_widget.dart';

class VideoItemWidget extends StatelessWidget {
  final VideoModel video;

  const VideoItemWidget({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player
        VideoPlayerWidget(videoUrl: video.videoUrl),

        // Gradient overlay at the bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),

        // Video Info (username, description, song)
        VideoInfoWidget(video: video),

        // Action buttons (like, comment, share, music disc)
        VideoActionsWidget(
          video: video,
          onLike: () {
            context.read<VideoProvider>().toggleLike(video.id);
          },
        ),
      ],
    );
  }
}
