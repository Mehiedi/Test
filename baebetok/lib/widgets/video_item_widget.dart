import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/video_model.dart';
import '../services/video_provider.dart';
import 'video_player_widget.dart';
import 'video_actions_widget.dart';
import 'video_info_widget.dart';

class VideoItemWidget extends StatefulWidget {
  final VideoModel video;

  const VideoItemWidget({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  bool _isUiVisible = true;
  Timer? _hideTimer;

  void _toggleUi() {
    setState(() {
      _isUiVisible = !_isUiVisible;
    });

    if (_isUiVisible) {
      // If turning ON, set timer to turn OFF after 3 seconds
      _hideTimer?.cancel();
      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isUiVisible = false;
          });
        }
      });
    } else {
      // If turning OFF manually, cancel any existing timer
      _hideTimer?.cancel();
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player Layer - Full Screen Tap Area
        GestureDetector(
          onTap: _toggleUi,
          child: VideoPlayerWidget(videoUrl: widget.video.videoUrl),
        ),

        // UI Overlay Layer (Fades in/out)
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isUiVisible ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !_isUiVisible,
            child: Stack(
              children: [
                // Premium gradient overlay with blur effect
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.9),
                        ],
                        stops: const [0.0, 0.3, 1.0],
                      ),
                    ),
                  ),
                ),

                // Mood badge - Premium glassmorphism style
                Positioned(
                  top: MediaQuery.of(context).padding.top + 60,
                  left: 16,
                  child: _buildMoodBadge(),
                ),

                // Video Info (username, description, song)
                Positioned(
                  left: 16,
                  bottom: 24,
                  right: 90,
                  child: VideoInfoWidget(video: widget.video),
                ),

                // Action buttons (like, comment, share, music disc)
                VideoActionsWidget(
                  video: widget.video,
                  onLike: () {
                    context.read<VideoProvider>().toggleLike(widget.video.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMoodBadge() {
    Color moodColor;
    IconData moodIcon;
    
    switch (widget.video.mood.toLowerCase()) {
      case 'chill':
        moodColor = const Color(0xFF6B5BFF);
        moodIcon = Icons.self_improvement_outlined;
        break;
      case 'hype':
        moodColor = const Color(0xFFFF4757);
        moodIcon = Icons.flash_on_outlined;
        break;
      case 'learn':
        moodColor = const Color(0xFF2ED573);
        moodIcon = Icons.school_outlined;
        break;
      case 'party':
        moodColor = const Color(0xFFFFA502);
        moodIcon = Icons.celebration_outlined;
        break;
      case 'focus':
        moodColor = const Color(0xFF3742FA);
        moodIcon = Icons.brain_outlined;
        break;
      default:
        moodColor = Colors.grey;
        moodIcon = Icons.tag_outlined;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: moodColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: moodColor.withOpacity(0.5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: moodColor.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(moodIcon, color: moodColor, size: 16),
          const SizedBox(width: 6),
          Text(
            widget.video.mood.toUpperCase(),
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: moodColor,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
