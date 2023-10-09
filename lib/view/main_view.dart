import 'package:auto_play_video_sample/view/home_view.dart';
import 'package:auto_play_video_sample/view/profile_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  void _changePage(int value) {
    _currentIndex = value;
    _pageController.jumpToPage(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        onDestinationSelected: _changePage,
        selectedIndex: _currentIndex,
        indicatorColor: Colors.lightBlue,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
