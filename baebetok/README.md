# Baebetok - Flutter App

A next-generation short-form video application built with Flutter, featuring **mood-based content curation**, **interactive polls**, **ghost mode** for private browsing, **premium glassmorphism UI**, **animated action buttons**, and a modern design that sets it apart from competitors.

## 🌟 Unique Features

- 🎭 **Mood-Based Feeds**: Filter content by mood (Chill, Hype, Learn, Party, Focus)
- 🗳️ **Interactive Polls**: Vote on poll questions embedded in videos
- 👻 **Ghost Mode**: Browse incognito without leaving viewing traces
- ✨ **Premium Glassmorphism UI**: Modern frosted glass effects with gradient overlays
- 🎨 **Animated Action Buttons**: Gradient buttons with glow effects on interaction
- 💿 **Rotating Music Disc**: Smooth 3D-like rotating disc animation
- 📱 **Vertical Video Feed**: Swipe up/down to navigate through videos
- ▶️ **Smart Video Player**: Tap to play/pause videos with auto-looping
- ❤️ **Like Functionality**: Double-tap or use the heart button with haptic feedback
- 💬 **Comments & Shares**: UI for comments and sharing (ready for backend integration)
- 🔍 **Discover Page**: Search and explore content
- 📥 **Inbox**: Messages and notifications
- 👤 **Profile Page**: User profile with stats and video grid
- ✅ **Verified Badges**: Blue checkmarks for verified creators
- 🔤 **Custom Typography**: Premium Google Fonts (Poppins, Inter) throughout
- 🏷️ **Mood Badges**: Color-coded glassmorphic badges on each video

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
- **google_fonts**: Premium typography (Poppins, Inter)
- **shimmer**: Loading skeleton effects

## Getting Started

1. Clone this repository
2. Run `flutter pub get`
3. Run `flutter run`

## Screenshots

The app features:
- Beautiful gradient overlays on videos
- Glassmorphic mood badges with icons
- Animated rotating music disc
- Premium action buttons with glow effects
- Verified creator badges
- Interactive polls with real-time results

## Future Enhancements

- Backend integration for user accounts
- Real-time messaging system
- Video upload functionality
- Advanced recommendation algorithm
- Live streaming support
