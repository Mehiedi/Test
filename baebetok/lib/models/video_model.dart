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
  });
}
