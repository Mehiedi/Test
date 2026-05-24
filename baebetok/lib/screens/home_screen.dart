import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_item_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import '../services/video_provider.dart';
import '../widgets/mood_selector_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    context.read<VideoProvider>().setCurrentIndex(page);
  }

  void _toggleGhostMode() {
    context.read<VideoProvider>().toggleGhostMode();
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider = context.watch<VideoProvider>();
    final videos = videoProvider.filteredVideos;
    final isGhostMode = videoProvider.ghostModeEnabled;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Mood Selector
          MoodSelectorWidget(),

          // Video feed with page view
          PageView.builder(
            controller: _pageController,
            itemCount: videos.length,
            scrollDirection: Axis.vertical,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return VideoItemWidget(video: videos[index]);
            },
          ),

          // Top navigation tabs (Following | For You)
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Following',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'For You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Top icons (ghost mode, cast, search)
          Positioned(
            top: 140,
            right: 15,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isGhostMode ? Icons.visibility_off : Icons.visibility,
                    color: isGhostMode ? Colors.purple : Colors.white,
                  ),
                  onPressed: _toggleGhostMode,
                  tooltip: isGhostMode ? 'Disable Ghost Mode' : 'Enable Ghost Mode',
                ),
                IconButton(
                  icon: const Icon(Icons.cast, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Ghost Mode Banner
          if (isGhostMode)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.visibility_off, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Ghost Mode Active - Browse Incognito',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
