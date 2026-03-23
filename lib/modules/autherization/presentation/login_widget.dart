import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/core/config/router.gr.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authCubit = di<AuthCubit>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _authCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authCubit,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 48),
        children: [
          AppPaddings.extraHuge.verticalSpace,
          _buildLoginTextField(
            label: 'Username, Mobile Number',
            controller: _usernameController,
          ),

          AppPaddings.small.verticalSpace,
          _buildLoginTextField(
            label: 'Password',
            controller: _passwordController,
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
          SizedBox(
            height: 56,

            child: BlocConsumer<AuthCubit, BaseState<bool>>(
              listener: (context, state) async {
                if (state.status == StateStatus.success) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('is_logged_in', true);
                  // ignore: use_build_context_synchronously
                  context.router.replaceAll([MainRoute()]);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state.status != StateStatus.loading) {
                      _authCubit.signIn(
                        _usernameController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF8774A),
                  ),
                  child: state.status == StateStatus.loading
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                          'Login',
                          style: AppTextStyle.medium
                              .setSize(17)
                              .copyWith(color: Color(0xffF6F6F9)),
                        ),
                );
              },
            ),
          ),
          AppPaddings.medium.verticalSpace,
          Center(child: Text('Or', style: AppTextStyle.medium.setSize(18))),
          AppPaddings.medium.verticalSpace,
          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1877F2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.facebookLogo,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Log In with Facebook',
                    style: AppTextStyle.medium
                        .setSize(17)
                        .copyWith(color: Color(0xffF6F6F9)),
                  ),
                ],
              ),
            ),
          ),
          AppPaddings.medium.verticalSpace,
          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.googleLogo,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Log In with Google',
                    style: AppTextStyle.medium
                        .setSize(17)
                        .copyWith(color: Color.fromARGB(255, 104, 103, 103)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
