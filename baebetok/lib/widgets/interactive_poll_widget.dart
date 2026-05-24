import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/video_model.dart';
import '../../services/video_provider.dart';

class InteractivePollWidget extends StatefulWidget {
  final VideoModel video;

  const InteractivePollWidget({Key? key, required this.video}) : super(key: key);

  @override
  State<InteractivePollWidget> createState() => _InteractivePollWidgetState();
}

class _InteractivePollWidgetState extends State<InteractivePollWidget> {
  String? _selectedOption;
  bool _hasVoted = false;

  void _vote(String option) {
    if (_hasVoted) return;
    
    setState(() {
      _selectedOption = option;
      _hasVoted = true;
    });

    context.read<VideoProvider>().voteOnPoll(widget.video.id, option);
    
    // Haptic feedback would go here in production
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.video.hasPoll || widget.video.pollOptions == null) {
      return const SizedBox.shrink();
    }

    final totalVotes = widget.video.pollOptions!.values.fold<int>(0, (sum, count) => sum + count);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.poll, color: Colors.pink, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.video.pollQuestion!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.video.pollOptions!.entries.map((entry) {
            final percentage = totalVotes > 0 
                ? ((entry.value / totalVotes) * 100).round() 
                : 0;
            final isSelected = _selectedOption == entry.key;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GestureDetector(
                onTap: () => _vote(entry.key),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? Colors.pink.withOpacity(0.8) 
                        : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.pink : Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: _hasVoted 
                            ? MediaQuery.of(context).size.width * 0.6 * (percentage / 100)
                            : 0,
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? Colors.pink 
                              : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry.key,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (_hasVoted)
                                Text(
                                  '$percentage%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          if (_hasVoted)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '$totalVotes votes',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
