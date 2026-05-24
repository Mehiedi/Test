import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoInfoWidget extends StatelessWidget {
  final VideoModel video;

  const VideoInfoWidget({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 20,
      right: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            video.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.music_note,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  video.songName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
