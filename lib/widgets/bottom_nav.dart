import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdlive_healthcare_app_ui/utils/extensions.dart';

import '../data/constants/constants.dart';
import '../main.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key, required this.context, required this.page});

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
      child: Container(
        alignment: Alignment.center,
        height: 104.h,
        padding: const EdgeInsets.all(25).r.copyWith(top: 5.h, bottom: 5.h),
        decoration: BoxDecoration(
          color: const Color(0xff3a4d7f),
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25).r,
            topLeft: const Radius.circular(25).r,
          ),
        ),
        child: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          currentIndex: widget.page,
          selectedItemColor: Colors.white,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => buildNavSwitch(index, context),
          iconSize: 28.h,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: NavBarActiveItemWidget(
                widget: widget,
                pageIndex: 0,
                child: const Icon(CupertinoIcons.home),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: NavBarActiveItemWidget(
                widget: widget,
                pageIndex: 1,
                child: const Icon(CupertinoIcons.book),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: NavBarActiveItemWidget(
                widget: widget,
                pageIndex: 2,
                child: const Icon(CupertinoIcons.bubble_left),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: NavBarActiveItemWidget(
                widget: widget,
                pageIndex: 3,
                child: const Icon(CupertinoIcons.bookmark),
              ),
            ),
          ],
        ),
      ),
    ); /*BottomNav(
        height: 82,
        padding: const EdgeInsets.all(25).copyWith(top: 5, bottom: 5),
        backgroundSelected: const Color(0xff4671c6) */ /*Colors.blue.shade900*/ /*,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        enableItemBackground: true,
        onTap: (index) => buildNavSwitch(index, context),
        iconSize: 23,
        backgroundColor: const Color(0xff3a4d7f) */ /*Colors.white.withOpacity(0.2)*/ /*,
        color: Theme.of(context).colorScheme.inversePrimary */ /*Colors.white.withOpacity(0.5)*/ /*,
        colorSelected: Colors.white,
        indexSelected: widget.page,
        items: const [
          BottomNavItem(label: '', child: CupertinoIcons.home),
          BottomNavItem(label: '', child: CupertinoIcons.book),
          BottomNavItem(label: '', child: CupertinoIcons.bubble_left),
          BottomNavItem(label: '', child: CupertinoIcons.bookmark),
        ],
      ),
    );*/
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

class NavBarActiveItemWidget extends StatelessWidget {
  const NavBarActiveItemWidget({
    super.key,
    required this.widget,
    required this.pageIndex,
    required this.child,
  });

  final CustomBottomNav widget;
  final double pageIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.h,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30).r,
        color: widget.page == pageIndex ? const Color(0xff4671C6) : Colors.transparent,
      ),
      child: child,
    );
  }
}
