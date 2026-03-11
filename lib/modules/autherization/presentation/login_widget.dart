import 'package:fast_food/core/constants/app_paddings.dart';
import 'package:fast_food/core/extensions/int_extension.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:fast_food/main.dart';
import 'package:fast_food/modules/autherization/presentation/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

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

            child: ElevatedButton(
              onPressed: () {
                _authCubit.signIn(
                  _usernameController.text,
                  _passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF8774A),
              ),
              child: Text(
                'Login',
                style: AppTextStyle.medium
                    .setSize(17)
                    .copyWith(color: Color(0xffF6F6F9)),
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
