import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/chats_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/diag_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_dashboard_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_dashboard_page1.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/recent_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/resources_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/search_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/more_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage ({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: PersistentTabController(),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeDash1(),
      RecentPage(),
      ChatsPage(),
      ResourcesPage(),
      MorePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Inicio",
        activeColorPrimary: Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/HomeDash',
          routes: {'/HomeDash': (context) => HomeDash1()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.pending_actions),
        title: "Historial",
        activeColorPrimary: Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/history',
          routes: {'/history': (context) => Container()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: "Chats",
        activeColorPrimary: Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/history',
          routes: {'/history': (context) => Container()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.eco),
        title: "Recursos",
        activeColorPrimary: Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/conversations',
          routes: {'/conversations': (context) => Container()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.pending),
        title: "Más",
        activeColorPrimary: Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/MorePage',
          routes: {'/MorePage': (context) => MorePage()},
        ),
      ),
    ];
  }
}