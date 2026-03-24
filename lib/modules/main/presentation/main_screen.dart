import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:fast_food/modules/main/presentation/widgets/bot_nav_bar.dart';
import 'package:fast_food/modules/main/presentation/widgets/restoraunts_list_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF4B3A),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),

        controller: _pageController,
        children: [
          SafeArea(child: RestorauntsListWidget()),
          Center(
            child: Text(
              'Offers',
              style: AppTextStyle.bold
                  .setSize(30)
                  .copyWith(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Cart',
              style: AppTextStyle.bold
                  .setSize(30)
                  .copyWith(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'User',
              style: AppTextStyle.bold
                  .setSize(30)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BotNavBar(pageController: _pageController),
      ),
    );
  }
}
