import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/resource/app_icon.dart';
import 'package:fast_food/core/resource/app_images.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeOneWidget extends StatelessWidget {
  const WelcomeOneWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPaddings.medium.horizontal,
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: GestureDetector(
                onTap: () {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                child: Text(
                  'Skip >>'.toUpperCase(),
                  style: AppTextStyle.large
                      .setSize(18)
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
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
              'Save Food with our new Feature!',
              textAlign: TextAlign.center,

              style: AppTextStyle.regular
                  .setSize(55)
                  .copyWith(
                    color: AppColors.white,
                    height: 1,
                    fontFamily: 'Metropolis',
                  ),
            ),

            Image.asset(AppImages.welcomeOne),
          ],
        ),
      ),
    );
  }
}
