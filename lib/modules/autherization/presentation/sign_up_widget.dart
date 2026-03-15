import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/resource/app_images.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:fast_food/main.dart';
import 'package:fast_food/modules/autherization/presentation/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onLoginTap;
  const SignUpWidget({
    super.key,
    required this.onLoginTap,
    required this.pageController,
    required this.tabController,
  });
  final PageController pageController;
  final TabController tabController;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _fullNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authCubit = di<AuthCubit>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _authCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 48),
      children: [
        AppPaddings.extraHuge.verticalSpace,
        Row(
          children: [
            Text(
              'Register',
              style: AppTextStyle.medium
                  .setSize(34)
                  .copyWith(color: Color(0xffF8774A)),
            ),
            SizedBox(width: 40),
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(AppImages.ggLogo),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(AppImages.fbLogo),
            ),
          ],
        ),
        AppPaddings.small.verticalSpace,
        _buildLoginTextField(
          label: 'Full Name',
          controller: _fullNameController,
        ),

        AppPaddings.small.verticalSpace,
        _buildLoginTextField(
          label: 'Mobile Number',
          controller: _mobileNumberController,
        ),
        AppPaddings.small.verticalSpace,
        _buildLoginTextField(
          label: 'Password',
          controller: _passwordController,
        ),
        AppPaddings.small.verticalSpace,
        _buildLoginTextField(
          label: 'Confirm Password',
          controller: _confirmPasswordController,
        ),
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
        Row(
          children: [
            SizedBox(
              height: 58,
              width: 170,
              child: BlocConsumer<AuthCubit, BaseState<bool>>(
                bloc: _authCubit,
                listener: (context, state) {
                  if (state.status == StateStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Регистрация прошла успешно!')),
                    );
                    widget.pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    widget.tabController.animateTo(0);
                  } else if (state.status == StateStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Регистрация не удалась: ${state.message}',
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      _authCubit.signUp(
                        fullName: _fullNameController.text,
                        password: _passwordController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF8774A),
                    ),
                    child: state.status == StateStatus.loading
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            'Sign-up',
                            style: AppTextStyle.medium
                                .setSize(17)
                                .copyWith(color: Color(0xffF6F6F9)),
                          ),
                  );
                },
              ),
            ),
            SizedBox(width: 15),
            GestureDetector(
              onTap: widget.onLoginTap,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already a\nMember? ',
                      style: AppTextStyle.medium
                          .setSize(15)
                          .copyWith(
                            color: Color(0xffB3B3B3),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: AppTextStyle.medium
                          .setSize(15)
                          .copyWith(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffB3B3B3),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildLoginTextField({
  required String label,
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
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
