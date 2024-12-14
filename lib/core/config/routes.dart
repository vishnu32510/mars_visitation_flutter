import 'package:flutter/material.dart';
import 'package:flutter_mars_visitation/presentation/dashboard.dart';
import 'package:flutter_mars_visitation/presentation/health_and_safety/views/health_and_safety_view.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/views/personal_infomation_view.dart';
import 'package:flutter_mars_visitation/presentation/success.dart';
import 'package:flutter_mars_visitation/presentation/travel_preferecne/views/travel_preferecne_view.dart';
import 'package:flutter_mars_visitation/splash_screen.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('Route: ${settings.name}');
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case PersonalInformation.routeName:
        return PersonalInformation.route();
      case TravelPreferecne.routeName:
        return TravelPreferecne.route();
      case HealthAndSafety.routeName:
        return HealthAndSafety.route();
      case Dashboard.routeName:
        return Dashboard.route();
      case SuccessPage.routeName:
        return SuccessPage.route();
      // case DashboardScreen.routeName:
      //   return DashboardScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Center(child: Text('Error Page')),
              ),
            ));
  }
}
