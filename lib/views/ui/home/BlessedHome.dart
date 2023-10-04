import 'package:blessed_academy/utils/colors.dart';
import 'package:blessed_academy/views/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Notification/notifications.dart';
import '../account/account.dart';
import '../chat/chat.dart';

class BlessedHome extends StatefulWidget {
  const BlessedHome({super.key});

  @override
  State<BlessedHome> createState() => _BlessedHomeState();
}

class _BlessedHomeState extends State<BlessedHome> {
  PersistentTabController? _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        confineInSafeArea: true,
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true,
        hideNavigationBarWhenKeyboardShows: true,
        resizeToAvoidBottomInset: true,
        // onWillPop: (p0) {
        //   return Future<bool>.value(true);
        // },
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style1,
      ),
    ));
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ('Home'),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/chat.svg'),
        title: ("Chat"),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_outlined),
        title: ('Notifications'),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_3_outlined),
        title: ('ACCOUNT'),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Chat(),
      const Notifications(),
      const Account(),
    ];
  }
}
