import 'package:blessed_academy/utils/colors.dart';
import 'package:blessed_academy/views/ui/home/home.dart';
import 'package:blessed_academy/views/ui/home/request_tutor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: FloatingActionButton.extended(onPressed: () {

          Get.to(() => RequestTutor());
        },
          label: const Text('Request Tutor'),
          icon: const Icon(Icons.chat_outlined),backgroundColor: kColorMainPrimary,),
      ),

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
        icon: Icon(Icons.book_online_outlined),
        title: ("Book"),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.live_tv_outlined),
        title: ('Live'),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_3_outlined),
        title: ('account'),
        activeColorPrimary: kColorMainPrimary,
        inactiveColorPrimary: kCTextColor,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Books(),
      const Live(),
      const Account(),
    ];
  }
}
