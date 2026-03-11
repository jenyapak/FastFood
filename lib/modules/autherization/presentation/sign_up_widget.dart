import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 48),
      children: [
        AppPaddings.extraHuge.verticalSpace,
        _buildLoginTextField('Full Name'),

        AppPaddings.small.verticalSpace,
        _buildLoginTextField('Mobile Number'),
        AppPaddings.small.verticalSpace,
        _buildLoginTextField('Password'),
        AppPaddings.small.verticalSpace,
        _buildLoginTextField('Confirm Password'),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password?',
              style: AppTextStyle.medium
                  .setSize(14)
                  .copyWith(color: Color(0xffFA4A0C)),
            ),
          ),
        ),
        AppPaddings.medium.verticalSpace,
        SizedBox(
          height: 56,

          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffF8774A)),
            child: Text(
              'Sign-up',
              style: AppTextStyle.medium
                  .setSize(17)
                  .copyWith(color: Color(0xffF6F6F9)),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildLoginTextField(String label) {
  return TextFormField(
    decoration: InputDecoration(
      fillColor: AppColors.white,
      label: Text(
        label,
        style: AppTextStyle.regular
            .setSize(16)
            .copyWith(color: Color(0xffA0A0A0)),
      ),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
