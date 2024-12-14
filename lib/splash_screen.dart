import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mars_visitation/core/utils/app_assets.dart';
import 'package:flutter_mars_visitation/core/utils/extentions/app_media_query_extensions.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/views/personal_infomation_view.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (context) => SplashScreen());
  }

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, PersonalInformation.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          height: context.height * 0.5,
          width: context.width * 0.5,
          child: GestureDetector(
            onDoubleTap: () {
              route();
            },
            child: Lottie.asset(
              AppAssets.splashLottie,
            ),
          ),
        ),
      ),
    );
  }
}
