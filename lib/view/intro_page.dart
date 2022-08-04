import 'package:auth_fire_getx/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: false,
      done: const Text('Done'),
      onDone: () => Get.to(() => const HomePage()),
      next: const Icon(Icons.arrow_forward),
      pages: [
        PageViewModel(
          image: SvgPicture.asset('assets/intro1.svg'),
          title: 'Todo App',
          body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed neque pulvinar, dapibus lacus ac, tincidunt nisl. Duis bibendum eleifend iaculis.',
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 50.0),
          ),
        ),
        PageViewModel(
          image: SvgPicture.asset('assets/intro2.svg'),
          title: 'Easy to use',
          body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed neque pulvinar, dapibus lacus ac, tincidunt nisl. Duis bibendum eleifend iaculis.',
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 50.0),
          ),
        ),
      ],
    );
  }
}
