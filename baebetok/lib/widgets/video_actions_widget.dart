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
      right: 12,
      bottom: 100,
      child: Column(
        children: [
          _buildActionButton(
            icon: Icons.favorite_rounded,
            label: _formatNumber(video.likes),
            isLiked: video.isLiked,
            onPressed: onLike,
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            icon: Icons.chat_bubble_rounded,
            label: _formatNumber(video.comments),
            onPressed: () {
              // Navigate to comments
            },
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            icon: Icons.bookmark_border_rounded,
            label: _formatNumber(video.shares),
            onPressed: () {
              // Share functionality
            },
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            icon: Icons.send_rounded,
            label: '',
            onPressed: () {
              // Share functionality
            },
          ),
          const SizedBox(height: 24),
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
            gradient: LinearGradient(
              colors: isLiked
                  ? [Colors.red.shade400, Colors.red.shade700]
                  : [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: isLiked
                ? [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            onPressed: onPressed,
            padding: const EdgeInsets.all(10),
          ),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMusicDisc() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 4),
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 2 * 3.14159,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade900, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      },
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
