import 'package:flutter/material.dart';
import 'package:flutter_mars_visitation/core/utils/app_assets.dart';
import 'package:flutter_mars_visitation/core/utils/extentions/app_media_query_extensions.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/views/personal_infomation_view.dart';
import 'package:flutter_mars_visitation/presentation/widgets/page_move_button.dart';
import 'package:flutter_mars_visitation/presentation/widgets/theme_button.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatelessWidget {
  static const String routeName = '/successPage';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (context) => SuccessPage());
  }

  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              floatingActionButton: ThemeHeader(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Container(
                height: context.height * 0.5,
                width: context.width * 0.5,
                child: Lottie.asset(
                  AppAssets.lottieSuccess2,
                  repeat: true,
                ),
              ),
              Expanded(child: SizedBox()),
              PageMoveButton(
                buttonText: "Done",
                isValid: true,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PersonalInformation.routeName, (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
