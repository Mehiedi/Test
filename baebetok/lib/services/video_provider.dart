import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoProvider with ChangeNotifier {
  final List<VideoModel> _videos = [
    VideoModel(
      id: '1',
      videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
      thumbnailUrl: '',
      username: '@neon_girl',
      description: 'Living in the future! 🌟 #neon #cyberpunk #vibes',
      songName: 'Synthwave Dreams - Original Mix',
      likes: 12500,
      comments: 342,
      shares: 89,
    ),
    VideoModel(
      id: '2',
      videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
      thumbnailUrl: '',
      username: '@nature_lover',
      description: 'Spring is here! 🌸 #nature #flowers #spring',
      songName: 'Peaceful Moments - Nature Sounds',
      likes: 8900,
      comments: 156,
      shares: 45,
    ),
    VideoModel(
      id: '3',
      videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4',
      thumbnailUrl: '',
      username: '@ocean_vibes',
      description: 'Ocean therapy 🌊 #ocean #waves #peaceful',
      songName: 'Ocean Waves - Relaxing Sounds',
      likes: 15600,
      comments: 423,
      shares: 112,
    ),
  ];

  int _currentIndex = 0;

  List<VideoModel> get videos => _videos;
  int get currentIndex => _currentIndex;
  VideoModel get currentVideo => _videos[_currentIndex];

  void setCurrentIndex(int index) {
    if (index >= 0 && index < _videos.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void toggleLike(String videoId) {
    final index = _videos.indexWhere((video) => video.id == videoId);
    if (index != -1) {
      final video = _videos[index];
      // In a real app, you'd create a new instance or use a more sophisticated state management
      notifyListeners();
    }
  }
}
