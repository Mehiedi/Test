import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  bool _isMuted = false;

  void _toggleUi() {
    setState(() {
      _isUiVisible = !_isUiVisible;
    });

    if (_isUiVisible) {
      _hideTimer?.cancel();
      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isUiVisible = false;
          });
        }
      });
    } else {
      _hideTimer?.cancel();
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    // Reset UI timer on interaction
    if (!_isUiVisible) {
      _toggleUi();
    }
  }

  void _showClearDisplay() {
    // Long press shows context menu for Clear Display
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.remove_red_eye_outlined, color: Colors.white),
              title: const Text(
                'Clear Display',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text(
                'Hide all UI for clean viewing',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _isUiVisible = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Clear Display activated'),
                    backgroundColor: Colors.grey[800],
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: 'Show UI',
                      textColor: Colors.purpleAccent,
                      onPressed: () {
                        setState(() {
                          _isUiVisible = true;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(_isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white),
              title: Text(
                _isMuted ? 'Unmute Video' : 'Mute Video',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                _toggleMute();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
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
          onLongPress: _showClearDisplay,
          child: VideoPlayerWidget(
            videoUrl: widget.video.videoUrl,
            isMuted: _isMuted,
          ),
        ),

        // Mute Indicator (when muted)
        if (_isMuted && _isUiVisible)
          Positioned(
            top: 100,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.volume_off,
                color: Colors.white,
                size: 24,
              ),
            ),
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
}
