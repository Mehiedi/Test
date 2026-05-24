import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/video_provider.dart';

class MoodSelectorWidget extends StatelessWidget {
  const MoodSelectorWidget({Key? key}) : super(key: key);

  Color _getMoodColor(VideoMood mood) {
    switch (mood) {
      case VideoMood.chill:
        return const Color(0xFF6B5BFF);
      case VideoMood.hype:
        return const Color(0xFFFF4757);
      case VideoMood.learn:
        return const Color(0xFF2ED573);
      case VideoMood.party:
        return const Color(0xFFFFA502);
      case VideoMood.focus:
        return const Color(0xFF3742FA);
    }
  }

  IconData _getMoodIcon(VideoMood mood) {
    switch (mood) {
      case VideoMood.chill:
        return Icons.self_improvement_rounded;
      case VideoMood.hype:
        return Icons.flash_on_rounded;
      case VideoMood.learn:
        return Icons.school_rounded;
      case VideoMood.party:
        return Icons.celebration_rounded;
      case VideoMood.focus:
        return Icons.brain_rounded;
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
      height: 64,
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
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [color.withOpacity(0.9), color],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? color : Colors.white.withOpacity(0.2),
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: color.withOpacity(0.4),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white.withOpacity(0.2) : null,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        _getMoodIcon(mood),
                        color: isSelected ? Colors.white : Colors.white60,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _getMoodLabel(mood),
                      style: GoogleFonts.poppins(
                        color: isSelected ? Colors.white : Colors.white60,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 13,
                        letterSpacing: 0.5,
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
