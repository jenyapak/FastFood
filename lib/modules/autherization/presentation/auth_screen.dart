import 'package:auto_route/auto_route.dart';
import 'package:fast_food/core/extensions/textstyle_extension.dart';
import 'package:fast_food/core/resource/app_icon.dart';
import 'package:fast_food/core/theme/app_colors.dart';
import 'package:fast_food/core/theme/app_text_style.dart';
import 'package:fast_food/modules/autherization/presentation/login_widget.dart';
import 'package:fast_food/modules/autherization/presentation/sign_up_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Expanded(child: SafeArea(child: Image.asset(AppIcon.iconOne))),
                TabBar(
                  controller: _tabController,
                  onTap: (int index) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  dividerHeight: 0,
                  indicatorColor: Color(0xffFA4A0C),
                  tabs: [
                    Tab(
                      child: Text(
                        'Login',
                        style: AppTextStyle.medium.setSize(18),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sign-up',
                        style: AppTextStyle.medium.setSize(18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.animateTo(index);
              },
              children: [
                LoginWidget(),
                SignUpWidget(
                  onLoginTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
