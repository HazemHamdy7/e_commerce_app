import 'package:e_commerce_app/view/screen/home_page/view/home_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/assest_image.dart';
import '../widget/slider_text.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimtion();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(AssestApp.splash)),
        SlidingText(slidingAnimation: slidingAnimation,)
        ],
      ),
    );
  }

  void initSlidingAnimtion() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }
}

void navigateToHome() {
  Future.delayed(
    const Duration(seconds: 2),
    () {},
  );
}
