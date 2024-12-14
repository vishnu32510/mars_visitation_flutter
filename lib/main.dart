import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mars_visitation/core/config/routes.dart';
import 'package:flutter_mars_visitation/core/modules/theme/theme.dart';
import 'package:flutter_mars_visitation/data/my_bloc_observer.dart';
import 'package:flutter_mars_visitation/presentation/health_and_safety/health_and_safety/health_and_safety_bloc.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/personal_information_bloc/personal_information_bloc.dart';
import 'package:flutter_mars_visitation/presentation/travel_preferecne/travel_preferecne/travel_preferecne_bloc.dart';
import 'package:flutter_mars_visitation/splash_screen.dart';
import 'core/utils/app_constants.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PersonalInformationBloc>(
        create: (context) => PersonalInformationBloc(),
      ),
      BlocProvider<TravelPreferenceBloc>(
        create: (context) => TravelPreferenceBloc(),
      ),
      BlocProvider<HealthAndSafetyBloc>(
        create: (context) => HealthAndSafetyBloc(),
      ),
    ],
    child: ThemeWrapper(child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          title: AppConstants.appTitle,
          theme: state.themeData,
          themeAnimationCurve: Curves.easeIn,
          themeAnimationDuration: const Duration(milliseconds: 500),
          themeMode: state.themeMode,
          darkTheme: DarkThemeState.darkTheme.themeData,
          onGenerateRoute: CustomRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          home: const SplashScreen(),
        );
      },
    );
  }
}
