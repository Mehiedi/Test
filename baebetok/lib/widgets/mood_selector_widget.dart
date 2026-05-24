import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/video_provider.dart';

class MoodSelectorWidget extends StatelessWidget {
  const MoodSelectorWidget({Key? key}) : super(key: key);

  Color _getMoodColor(VideoMood mood) {
    switch (mood) {
      case VideoMood.chill:
        return Colors.blue;
      case VideoMood.hype:
        return Colors.orange;
      case VideoMood.learn:
        return Colors.green;
      case VideoMood.party:
        return Colors.pink;
      case VideoMood.focus:
        return Colors.purple;
    }
  }

  IconData _getMoodIcon(VideoMood mood) {
    switch (mood) {
      case VideoMood.chill:
        return Icons.self_improvement;
      case VideoMood.hype:
        return Icons.flash_on;
      case VideoMood.learn:
        return Icons.school;
      case VideoMood.party:
        return Icons.party_mode;
      case VideoMood.focus:
        return Icons.psychology;
    }
  }

  String _getMoodLabel(VideoMood mood) {
    switch (mood) {
      case VideoMood.chill:
        return 'Chill';
      case VideoMood.hype:
        return 'Hype';
      case VideoMood.learn:
        return 'Learn';
      case VideoMood.party:
        return 'Party';
      case VideoMood.focus:
        return 'Focus';
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider = context.watch<VideoProvider>();
    final selectedMood = videoProvider.selectedMood;

    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 80),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: VideoMood.values.map((mood) {
          final isSelected = selectedMood == mood;
          final color = _getMoodColor(mood);

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => videoProvider.setMood(mood),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? color.withOpacity(0.8) : Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected ? color : Colors.white.withOpacity(0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getMoodIcon(mood),
                      color: isSelected ? Colors.white : Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _getMoodLabel(mood),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
