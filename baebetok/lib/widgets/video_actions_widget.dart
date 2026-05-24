import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/video_model.dart';
import '../services/video_provider.dart';
import 'interactive_poll_widget.dart';

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
    final videoProvider = context.watch<VideoProvider>();
    final isGhostMode = videoProvider.ghostModeEnabled;

    return Positioned(
      right: 10,
      bottom: 100,
      child: Column(
        children: [
          if (isGhostMode)
            _buildGhostModeIndicator(),
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
          if (video.hasPoll) ...[
            const SizedBox(height: 20),
            _buildPollIndicator(),
          ],
          const SizedBox(height: 30),
          _buildMusicDisc(),
        ],
      ),
    );
  }

  Widget _buildGhostModeIndicator() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.visibility_off,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  Widget _buildPollIndicator() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.poll,
        color: Colors.white,
        size: 28,
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
