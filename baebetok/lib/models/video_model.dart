enum VideoMood { chill, hype, learn, party, focus }

class VideoModel {
  final String id;
  final String videoUrl;
  final String thumbnailUrl;
  final String username;
  final String description;
  final String songName;
  final int likes;
  final int comments;
  final int shares;
  final bool isLiked;
  final VideoMood mood;
  final bool hasPoll;
  final Map<String, int>? pollOptions;
  final String? pollQuestion;
  final bool isGhostModeCompatible;

  VideoModel({
    required this.id,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.username,
    required this.description,
    required this.songName,
    required this.likes,
    required this.comments,
    required this.shares,
    this.isLiked = false,
    this.mood = VideoMood.chill,
    this.hasPoll = false,
    this.pollOptions,
    this.pollQuestion,
    this.isGhostModeCompatible = true,
  });
}
