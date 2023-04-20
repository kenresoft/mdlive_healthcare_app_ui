import 'package:bottom_nav/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdlive_healthcare_app_ui/utils/extensions.dart';

import '../data/constants/constants.dart';
import '../main.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key, required this.context, required this.page}) : super(key: key);

  final BuildContext context;
  final int page;

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNav(
        height: 82,
        padding: const EdgeInsets.all(25).copyWith(top: 5, bottom: 5),
        backgroundSelected: const Color(0xff4671c6) /*Colors.blue.shade900*/,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        enableItemBackground: true,
        onTap: (index) => buildNavSwitch(index, context),
        iconSize: 23,
        backgroundColor: const Color(0xff3a4d7f) /*Colors.white.withOpacity(0.2)*/,
        color: Theme.of(context).colorScheme.inversePrimary /*Colors.white.withOpacity(0.5)*/,
        colorSelected: Colors.white,
        indexSelected: widget.page,
        items: const [
          BottomNavItem(label: '', child: CupertinoIcons.home),
          BottomNavItem(label: '', child: CupertinoIcons.book),
          BottomNavItem(label: '', child: CupertinoIcons.bubble_left),
          BottomNavItem(label: '', child: CupertinoIcons.bookmark),
        ],
      ),
    );
  }

  void buildNavSwitch(int index, BuildContext context) {
    switch (index) {
      case 0:
        if (widget.page != 0) {
          launch(context, Constants.home); //launchReplace
        }
        break;
      case 1:
        if (widget.page != 1) {
          launch(context, Constants.call);
        }
        break;
      case 2:
        if (widget.page != 2) {
          launch(context, Constants.chat);
        }
        break;
      case 3:
        'Bookmark'.toast;
        break;
      default:
    }
  }
}
