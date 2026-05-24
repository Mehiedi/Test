import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_item_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import '../services/video_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
    final isGhostMode = videoProvider.ghostModeEnabled;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main Content with Tabs and Video Feed
          Column(
            children: [
              // Top App Bar with Tabs
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          tabs: const [
                            Tab(text: 'For You'),
                            Tab(text: 'Following'),
                            Tab(text: 'Twist'), // Unique Section
                          ],
                        ),
                      ),
                      // Search Icon on Top Right
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              // Video Feed
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildVideoList('foryou'),
                    _buildVideoList('following'),
                    _buildVideoList('twist'),
                  ],
                ),
              ),
            ],
          ),

          // Ghost Mode Toggle (Top Right below search)
          Positioned(
            top: 60,
            right: 15,
            child: IconButton(
              icon: Icon(
                isGhostMode ? Icons.visibility_off : Icons.visibility,
                color: isGhostMode ? Colors.purple : Colors.white,
              ),
              onPressed: _toggleGhostMode,
              tooltip: isGhostMode ? 'Disable Ghost Mode' : 'Enable Ghost Mode',
            ),
          ),

          // Ghost Mode Banner
          if (isGhostMode)
            Positioned(
              top: 110,
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
                      'Ghost Mode Active',
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

  Widget _buildVideoList(String type) {
    return Consumer<VideoProvider>(
      builder: (context, provider, child) {
        var videos = provider.videos;
        
        // Simple filtering logic
        if (type == 'following') {
          videos = videos.where((v) => v.isFollowing).toList();
        } else if (type == 'twist') {
          // Twist: High engagement or trending content
          videos = videos.where((v) => v.likes > 500).toList();
        }

        if (videos.isEmpty) {
          return const Center(
            child: Text(
              'No videos yet',
              style: TextStyle(color: Colors.white70),
            ),
          );
        }

        return PageView.builder(
          controller: _pageController,
          itemCount: videos.length,
          scrollDirection: Axis.vertical,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            return VideoItemWidget(video: videos[index]);
          },
        );
      },
    );
  }
}
