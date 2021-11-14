import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:planet_zoo/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/search/search_bloc.dart';
import '../theme.dart';
import 'explore/explore_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.simple,
      floatingActionButton: FloatingActionButton(
        backgroundColor: warningColor,
        child: const Icon(Icons.call),
        onPressed: () => launch('tel://0906365321'),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider<SearchBloc>.value(
        value: context.read<SearchBloc>(),
        child: const HomeScreen(),
      ),
      BlocProvider<SearchBloc>.value(
        value: context.read<SearchBloc>(),
        child: const ExploreScreen(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        title: ("Home"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Explore"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
