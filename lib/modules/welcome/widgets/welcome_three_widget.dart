import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/config/router.gr.dart';
import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/resource/app_icon.dart';
import 'package:fast_food/core/resource/app_images.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeThreeWidget extends StatelessWidget {
  const WelcomeThreeWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPaddings.medium.horizontal,
        child: Column(
          children: [
            AppPaddings.large.verticalSpace,
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: Image.asset(AppIcon.iconOne, scale: 4),
            ),
            AppPaddings.large.verticalSpace,
            Text(
              'Fast, rescued food at your service.',
              textAlign: TextAlign.center,

              style: AppTextStyle.regular
                  .setSize(40)
                  .copyWith(
                    color: AppColors.white,
                    height: 0.9,
                    fontFamily: 'Metropolis',
                  ),
            ),

            Expanded(
              child: Image.asset(AppImages.welcomeThree, fit: BoxFit.contain),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 314,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.replaceAll([AuthRoute()]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xffFF470B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get started!',
                    style: AppTextStyle.large.setSize(17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
