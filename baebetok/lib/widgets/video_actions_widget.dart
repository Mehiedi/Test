import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoActionsWidget extends StatelessWidget {
  final VideoModel video;
  final VoidCallback? onLike;

  const VideoActionsWidget({
    Key? key,
    required this.video,
    this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 100,
      child: Column(
        children: [
          _buildActionButton(
            icon: Icons.favorite,
            label: '${_formatNumber(video.likes)}',
            isLiked: video.isLiked,
            onPressed: onLike,
          ),
          const SizedBox(height: 20),
          _buildActionButton(
            icon: Icons.comment,
            label: '${_formatNumber(video.comments)}',
            onPressed: () {
              // Navigate to comments
            },
          ),
          const SizedBox(height: 20),
          _buildActionButton(
            icon: Icons.share,
            label: '${_formatNumber(video.shares)}',
            onPressed: () {
              // Share functionality
            },
          ),
          const SizedBox(height: 30),
          _buildMusicDisc(),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    bool isLiked = false,
    VoidCallback? onPressed,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              icon,
              color: isLiked ? Colors.red : Colors.white,
              size: 35,
            ),
            onPressed: onPressed,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMusicDisc() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: const Center(
        child: Icon(
          Icons.music_note,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
}
