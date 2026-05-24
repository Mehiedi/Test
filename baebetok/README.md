# Baebetok - Flutter App

A next-generation short-form video application built with Flutter, featuring **mood-based content curation**, **interactive polls**, **ghost mode** for private browsing, and a modern UI that sets it apart from competitors.

## 🌟 Unique Features

- 🎭 **Mood-Based Feeds**: Filter content by mood (Chill, Hype, Learn, Party, Focus)
- 🗳️ **Interactive Polls**: Vote on poll questions embedded in videos
- 👻 **Ghost Mode**: Browse incognito without leaving viewing traces
- 📱 **Vertical Video Feed**: Swipe up/down to navigate through videos
- ▶️ **Video Player**: Tap to play/pause videos with auto-looping
- ❤️ **Like Functionality**: Double-tap or use the heart button to like videos
- 💬 **Comments & Shares**: UI for comments and sharing (ready for backend integration)
- 🎵 **Music Disc Animation**: Rotating music disc indicator
- 🔍 **Discover Page**: Search and explore content
- 📥 **Inbox**: Messages and notifications
- 👤 **Profile Page**: User profile with stats and video grid
- 🎨 **Modern UI**: Dark theme with gradient accents and custom animations

## Project Structure

```
baebetok/
├── lib/
│   ├── main.dart                      # App entry point
│   ├── models/
│   │   └── video_model.dart           # Video data model with mood & polls
│   ├── screens/
│   │   ├── home_screen.dart           # Main video feed with mood selector
│   │   ├── discover_screen.dart       # Search/discover page
│   │   ├── inbox_screen.dart          # Messages/inbox
│   │   └── profile_screen.dart        # User profile
│   ├── services/
│   │   └── video_provider.dart        # State management with mood filtering
│   └── widgets/
│       ├── bottom_nav_bar.dart             # Bottom navigation
│       ├── video_player_widget.dart        # Video player component
│       ├── video_actions_widget.dart       # Like, comment, share, ghost mode
│       ├── video_info_widget.dart          # Username, description, song
│       ├── video_item_widget.dart          # Complete video item
│       ├── interactive_poll_widget.dart    # 🆕 Poll voting UI
│       └── mood_selector_widget.dart       # 🆕 Mood filter chips
├── assets/
│   └── images/
└── pubspec.yaml
```

## Dependencies

- **video_player**: Native video playback
- **provider**: State management
- **cached_network_image**: Image caching
- **http**: Network requests
- **flutter_animate**: Smooth animations
- **vibration**: Haptic feedback
- **share_plus**: Native sharing functionality
- **shared_preferences**: Local storage for history & settings

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- iOS Simulator or Android Emulator

### Installation

1. Clone the repository:
```bash
cd baebetok
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Usage

### Core Features
- **Swipe Up/Down**: Navigate between videos
- **Tap Video**: Play/Pause
- **Heart Icon**: Like the video
- **Comment Icon**: View/add comments
- **Share Icon**: Share the video
- **Bottom Navigation**: Switch between Home, Discover, Inbox, and Profile

### 🆕 Unique Features
- **Mood Selector**: Tap mood chips at the top (Chill, Hype, Learn, Party, Focus) to filter content
- **Interactive Polls**: Vote on poll questions displayed on videos with poll indicators
- **Ghost Mode**: Toggle the eye icon to browse incognito - your activity won't be tracked

## Customization

### Adding New Videos with Moods and Polls

Edit `lib/services/video_provider.dart` and add new `VideoModel` instances:

```dart
// Video with mood only
VideoModel(
  id: '4',
  videoUrl: 'YOUR_VIDEO_URL',
  thumbnailUrl: 'YOUR_THUMBNAIL_URL',
  username: '@your_username',
  description: 'Your description #hashtags',
  songName: 'Song Name - Artist',
  likes: 1000,
  comments: 50,
  shares: 20,
  mood: VideoMood.hype, // chill, hype, learn, party, focus
),

// Video with interactive poll
VideoModel(
  id: '5',
  videoUrl: 'YOUR_VIDEO_URL',
  thumbnailUrl: 'YOUR_THUMBNAIL_URL',
  username: '@your_username',
  description: 'What do you think? #poll',
  songName: 'Song Name - Artist',
  likes: 2000,
  comments: 100,
  shares: 50,
  mood: VideoMood.party,
  hasPoll: true,
  pollQuestion: 'Which is better?',
  pollOptions: {'Option A': 150, 'Option B': 120, 'Option C': 89},
),
```

### Changing Theme Colors

Modify `lib/main.dart`:

```dart
theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.white,
  // Add your custom colors here
),
```

## Backend Integration

To connect this app to a real backend:

1. Replace the sample data in `video_provider.dart` with API calls
2. Implement authentication (Firebase, Auth0, or custom)
3. Add real-time updates for likes, comments, shares, and poll votes
4. Integrate video upload functionality
5. Add user profiles and following system
6. Store ghost mode preferences and viewing history
7. Implement mood-based recommendation algorithms

## Screenshots

The app includes:
- Home screen with vertical video feed and mood selector chips
- Interactive poll overlays on participating videos
- Ghost mode banner and toggle button
- Top navigation (Following | For You)
- Action buttons on the right side with poll & ghost mode indicators
- Video info overlay at the bottom
- Bottom navigation bar with 5 tabs
- Gradient "Add" button in the center

## Roadmap

- [ ] AI-powered mood detection from video content
- [ ] Create custom polls for your videos
- [ ] Enhanced ghost mode with view history clearing
- [ ] Duet and stitch functionality
- [ ] AR filters and effects
- [ ] Live streaming support
- [ ] Creator monetization tools

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

If you have any questions or issues, please open an issue in the repository.
