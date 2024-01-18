import 'package:final_project/core/shared_pref/shared_pref.dart';
import 'package:final_project/features/dashboard/dashboard_page.dart';
import 'package:final_project/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class Staring_Page extends StatefulWidget {
  const Staring_Page({super.key});

  @override
  State<Staring_Page> createState() => _Staring_PageState();
}

class _Staring_PageState extends State<Staring_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(

        ),
      ),
    );
  }

  Future<void> handleRouting() async {
    final hasSeenOnboarding = await SharedPref.getOnboardingStatus();

    if (!hasSeenOnboarding) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => OnBoardingPage()));

      await SharedPref.saveOnboardingStatus(true);
    }
    else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => Dashboard()));
    }
  }
}