import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoProvider with ChangeNotifier {
  bool _ghostModeEnabled = false;
  VideoMood _selectedMood = VideoMood.chill;
  
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
      mood: VideoMood.party,
      hasPoll: true,
      pollQuestion: 'Which neon color is best?',
      pollOptions: {'Pink 💖': 120, 'Blue 💙': 95, 'Purple 💜': 78},
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
      mood: VideoMood.chill,
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
      mood: VideoMood.focus,
    ),
    VideoModel(
      id: '4',
      videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-white-sand-beach-1166-large.mp4',
      thumbnailUrl: '',
      username: '@travel_addict',
      description: 'Paradise found! 🏝️ #travel #beach #wanderlust',
      songName: 'Summer Vibes - Beach Beats',
      likes: 23400,
      comments: 567,
      shares: 234,
      mood: VideoMood.hype,
      hasPoll: true,
      pollQuestion: 'Best beach activity?',
      pollOptions: {'Surfing 🏄': 200, 'Sunbathing ☀️': 150, 'Beach Volleyball 🏐': 89},
    ),
    VideoModel(
      id: '5',
      videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-man-dancing-under-changing-color-lights-1246-large.mp4',
      thumbnailUrl: '',
      username: '@dance_king',
      description: 'New moves! 💃 #dance #moves #trending',
      songName: 'Dance Floor Hits - DJ Master',
      likes: 45600,
      comments: 890,
      shares: 456,
      mood: VideoMood.party,
    ),
  ];

  int _currentIndex = 0;

  List<VideoModel> get videos => _videos;
  int get currentIndex => _currentIndex;
  VideoModel get currentVideo => _videos[_currentIndex];
  bool get ghostModeEnabled => _ghostModeEnabled;
  VideoMood get selectedMood => _selectedMood;
  
  List<VideoModel> get filteredVideos {
    if (_selectedMood == VideoMood.chill) {
      return _videos.where((v) => v.mood == VideoMood.chill || v.mood == VideoMood.focus).toList();
    }
    return _videos.where((v) => v.mood == _selectedMood).toList();
  }

  void setCurrentIndex(int index) {
    if (index >= 0 && index < _videos.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void toggleGhostMode() {
    _ghostModeEnabled = !_ghostModeEnabled;
    notifyListeners();
  }

  void setMood(VideoMood mood) {
    _selectedMood = mood;
    _currentIndex = 0;
    notifyListeners();
  }

  void toggleLike(String videoId) {
    final index = _videos.indexWhere((video) => video.id == videoId);
    if (index != -1) {
      final video = _videos[index];
      notifyListeners();
    }
  }

  void voteOnPoll(String videoId, String option) {
    final index = _videos.indexWhere((video) => video.id == videoId);
    if (index != -1 && _videos[index].pollOptions != null) {
      notifyListeners();
    }
  }
}
