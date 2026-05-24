# Baebetok - Flutter App

A fully functional TikTok clone application built with Flutter, featuring vertical video scrolling, like/comment/share functionality, and a modern UI.

## Features

- 📱 **Vertical Video Feed**: Swipe up/down to navigate through videos
- ▶️ **Video Player**: Tap to play/pause videos with auto-looping
- ❤️ **Like Functionality**: Double-tap or use the heart button to like videos
- 💬 **Comments & Shares**: UI for comments and sharing (ready for backend integration)
- 🎵 **Music Disc Animation**: Rotating music disc indicator
- 🔍 **Discover Page**: Search and explore content
- 📥 **Inbox**: Messages and notifications
- 👤 **Profile Page**: User profile with stats and video grid
- 🎨 **Modern UI**: Dark theme with gradient accents matching TikTok's design

## Project Structure

```
tiktok_clone/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/
│   │   └── video_model.dart      # Video data model
│   ├── screens/
│   │   ├── home_screen.dart      # Main video feed
│   │   ├── discover_screen.dart  # Search/discover page
│   │   ├── inbox_screen.dart     # Messages/inbox
│   │   └── profile_screen.dart   # User profile
│   ├── services/
│   │   └── video_provider.dart   # State management (Provider)
│   └── widgets/
│       ├── bottom_nav_bar.dart        # Bottom navigation
│       ├── video_player_widget.dart   # Video player component
│       ├── video_actions_widget.dart  # Like, comment, share buttons
│       ├── video_info_widget.dart     # Username, description, song
│       └── video_item_widget.dart     # Complete video item
├── assets/
│   └── images/
└── pubspec.yaml
```

## Dependencies

- **video_player**: Native video playback
- **provider**: State management
- **cached_network_image**: Image caching (for future use)
- **http**: Network requests (for API integration)

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- iOS Simulator or Android Emulator

### Installation

1. Clone the repository:
```bash
cd tiktok_clone
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

- **Swipe Up/Down**: Navigate between videos
- **Tap Video**: Play/Pause
- **Heart Icon**: Like the video
- **Comment Icon**: View/add comments
- **Share Icon**: Share the video
- **Bottom Navigation**: Switch between Home, Discover, Inbox, and Profile

## Customization

### Adding New Videos

Edit `lib/services/video_provider.dart` and add new `VideoModel` instances:

```dart
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
3. Add real-time updates for likes, comments, and shares
4. Integrate video upload functionality
5. Add user profiles and following system

## Screenshots

The app includes:
- Home screen with vertical video feed
- Top navigation (Following | For You)
- Action buttons on the right side
- Video info overlay at the bottom
- Bottom navigation bar with 5 tabs
- Gradient "Add" button in the center

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

If you have any questions or issues, please open an issue in the repository.
