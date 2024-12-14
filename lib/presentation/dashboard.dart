import 'package:flutter/material.dart';
import 'package:flutter_mars_visitation/core/utils/app_assets.dart';
import 'package:flutter_mars_visitation/core/utils/extentions/app_media_query_extensions.dart';
import 'package:flutter_mars_visitation/presentation/health_and_safety/views/health_and_safety_view.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/views/personal_infomation_view.dart';
import 'package:flutter_mars_visitation/presentation/travel_preferecne/views/travel_preferecne_view.dart';
import 'package:flutter_mars_visitation/presentation/widgets/theme_button.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (context) => Dashboard());
  }

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.background
          // image: DecorationImage(
          //   opacity: 0.5,
          //   fit: BoxFit.fill,
          //   image: AssetImage(AppAssets.background))
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          // scrollDirection:
          // Axis.vertical,
          children: [
            Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DisplayPages(
                    child: PersonalInformation(),
                  ),
                ],
              ),
              LottieImageDisplay(),
            ]),
            Row(children: [
              LottieImageDisplay(),
              DisplayPages(child: TravelPreferecne()),
            ]),
            Row(children: [
              DisplayPages(child: HealthAndSafety()),
              LottieImageDisplay(),
            ]),
          ],
        ),
        floatingActionButton: ThemeHeader(),
      ),
    );
  }
}

class DisplayPages extends StatelessWidget {
  final Widget child;
  const DisplayPages({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2,
      height: context.height,
      // color: Theme.of(context).colorScheme.background,
      color: Colors.transparent,

      child: child,
    );
  }
}

class LottieImageDisplay extends StatelessWidget {
  final String? name;
  const LottieImageDisplay({
    super.key,
    this.name = AppAssets.splashLottie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2,
      height: context.height,
      // color: Theme.of(context).colorScheme.background,
      color: Colors.transparent,
      child: Lottie.asset(
        name!,
      ),
    );
  }
}
