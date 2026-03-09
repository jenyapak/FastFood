import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/modules/welcome/widgets/welcome_one_widget.dart';
import 'package:fast_food/modules/welcome/widgets/welcome_three_widget.dart';
import 'package:fast_food/modules/welcome/widgets/welcome_two_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcome,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                WelcomeOneWidget(pageController: _pageController),
                WelcomeTwoWidget(pageController: _pageController),
                WelcomeThreeWidget(pageController: _pageController),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: JumpingDotEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Color(0xffFFDFD4),
              dotColor: Color(0xffFF855D),
            ),
            onDotClicked: (index) {},
          ),
          AppPaddings.large.verticalSpace,
        ],
      ),
    );
  }
}
