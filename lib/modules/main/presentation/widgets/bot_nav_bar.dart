import 'package:fast_food/core/resource/app_icon.dart';
import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  final PageController pageController;
  const BotNavBar({super.key, required this.pageController});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  final _activeIndex = ValueNotifier(0);

  @override
  void dispose() {
    _activeIndex.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _activeIndex,
      builder: (context, value, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 30,
          showSelectedLabels: false,
          items: [
            _botNavItem(AppIcon.homeIcon, context, value == 0, 'Home'),
            _botNavItem(AppIcon.starIcon, context, value == 1, 'Offers'),
            _botNavItem(AppIcon.cartIcon, context, value == 2, 'Cart'),
            _botNavItem(AppIcon.profileIcon, context, value == 3, 'User'),
          ],
          currentIndex: value,
          onTap: (index) {
            _activeIndex.value = index;
            widget.pageController.jumpToPage(index);
          },
        );
      },
    );
  }
}

BottomNavigationBarItem _botNavItem(
  String icon,
  BuildContext context,
  bool isActive,
  String labelText,
) {
  return BottomNavigationBarItem(
    icon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),

          decoration: isActive
              ? BoxDecoration(
                  color: Color(0xffFA4A0C),
                  borderRadius: BorderRadius.circular(20),
                )
              : null,

          child: Image.asset(
            icon,
            width: 24,
            height: 24,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(width: 6),
        if (isActive) ...[
          Text(
            labelText,
            style: const TextStyle(
              color: Color(0xffFA4A0C),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ],
    ),
    label: '',
  );
}
