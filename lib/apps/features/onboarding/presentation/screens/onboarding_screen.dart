import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../../generated/image_assets.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/responsive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_OnboardData> _pages = const [
    _OnboardData(
      image: AppImages.onboarding1,
      title: 'Trusted Doctors',
      subtitle:
      'Contrary to popular belief, Lorem Ipsum is not simply random text. '
          'It has roots in a piece of it over 2000 years old.',
    ),
    _OnboardData(
      image: AppImages.onboarding2,
      title: 'Choose Best Doctors',
      subtitle:
      'Contrary to popular belief, Lorem Ipsum is not simply random text. '
          'It has roots in a piece of it over 2000 years old.',
    ),
    _OnboardData(
      image: AppImages.onboarding3,
      title: 'Easy Appointments',
      subtitle:
      'Contrary to popular belief, Lorem Ipsum is not simply random text. '
          'It has roots in a piece of it over 2000 years old.',
    ),
  ];

  bool get _isLast => _currentPage == _pages.length - 1;

  void _next() {
    if (_isLast) {
      context.go('/choose-role');
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFFFFF), Color(0xFFE6F9EF)],
            ),
          ),

        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: context.width(0.06)),
                      child: Column(
                        children: [
                          SizedBox(height: context.height(0.06)),
                          ClipOval(
                            child: Image.asset(
                              page.image,
                              width: context.width(0.7),
                              height: context.width(0.7),
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(height: context.height(0.06)),

                          Text(page.title, style: AppTextStyles.title),
                          SizedBox(height: context.height(0.02)),
                          Text(
                            page.subtitle,
                            style: AppTextStyles.subtitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(context.width(0.06)),
                child: Column(
                  children: [
                    CustomButton(
                      text: _isLast ? 'Get Started' : 'Next',
                      onPressed: _next,
                    ),
                    SizedBox(height: context.height(0.015)),
                    TextButton(
                      onPressed: () => context.go('/choose-role'),
                      child: Text('Skip', style: AppTextStyles.subtitle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardData {
  final String image;
  final String title;
  final String subtitle;
  const _OnboardData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}