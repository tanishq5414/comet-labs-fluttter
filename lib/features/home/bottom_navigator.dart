import 'package:cometlabs/features/bookmark/screen/bookmark_screen_view.dart';
import 'package:cometlabs/features/home/home.dart';
import 'package:cometlabs/features/search/screen/search_view.dart';
import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  var selectedIndex = 0;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var pages = [
      const HomePageScreen(),
      const SearchViewWidget(),
      const BookmarkScreenWidget(),
    ];

    var items = const [
      BottomNavigationBarItem(
          icon: Icon(OctIcons.home_24, size: 30),
          label: 'Home',
          backgroundColor: Pallete.darkGreyColor),
      BottomNavigationBarItem(
        icon: Icon(OctIcons.search_16, size: 30),
        label: 'Search',
        backgroundColor: Pallete.darkGreyColor,
      ),
      BottomNavigationBarItem(
          icon: Icon(OctIcons.bookmark_16, size: 30),
          label: 'Bookmark',
          backgroundColor: Pallete.darkGreyColor),
    ];
    return Container(
      color: Pallete.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              pages[selectedIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.1,
                  width: size.width,
                  color: Colors.transparent,
                  margin: EdgeInsets.only(
                      bottom: size.width * 0.05,
                      right: size.width * 0.2,
                      left: size.width * 0.2),
                  child: BottomNavigationBar(
                    items: items,
                    currentIndex: 0,
                    selectedItemColor: Pallete.whiteColor,
                    unselectedItemColor: Pallete.lightGreyColor,
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
