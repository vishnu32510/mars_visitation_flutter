import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mars_visitation/core/utils/app_assets.dart';
import 'package:flutter_mars_visitation/presentation/dashboard.dart';
import 'package:flutter_mars_visitation/presentation/health_and_safety/views/health_and_safety_view.dart';
import 'package:flutter_mars_visitation/presentation/travel_preferecne/travel_preferecne/travel_preferecne_bloc.dart';
import 'package:flutter_mars_visitation/presentation/widgets/custom_text_field.dart';
import 'package:flutter_mars_visitation/presentation/widgets/page_move_button.dart';
import 'package:flutter_mars_visitation/presentation/widgets/theme_button.dart';
import 'package:formz/formz.dart';

class TravelPreferecne extends StatelessWidget {
  static const String routeName = '/TravelPreferecne';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(
          name: routeName,
        ),
        builder: (context) => TravelPreferecne());
  }

  const TravelPreferecne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ThemeHeader(),
      body: BlocConsumer<TravelPreferenceBloc, TravelPreferenceState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Failure')),
            );
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                      LottieImageDisplay(name: AppAssets.lottie2,),
          DisplayPages(
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Travel Preference',
                  textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.primary),
                ),
                _DepartureDate(),
                _ReturnDate(),
                _AccomadationPreference(),
                _SpecialRequest(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PageMoveButton(
                      buttonText: "Previous Page",
                      isValid: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    PageMoveButton(
                      buttonText: "Next Page",
                      isValid: state.isValid,
                      onPressed: () {
                        Navigator.pushNamed(context, HealthAndSafety.routeName);
                      },
                    ),
                  ],
                )
              ],
                        ),
            ),
          ),
        ]);
      },
    ),
    );
  }
}

class _SpecialRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.specialRequest.displayError,
    );
    return CustomTextField(
      labelText: 'Special Request',
      key: const Key('special_request_Input_textField'),
      onChanged: (specialRequest) {
        context.read<TravelPreferenceBloc>().add(SpecialRequestChangedEvent(specialRequest));
      },
      errorText: displayError != null ? 'Invalid Email' : null,
    );
  }
}

class _AccomadationPreference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.accomadationPreference.displayError,
    );
    return CustomTextField(
      labelText: 'Accomadation Preference',
      key: const Key('accomadationPreferenceInput_textField'),
      onChanged: (accomadationPreference) {
        context
            .read<TravelPreferenceBloc>()
            .add(AccomadationPreferenceChangedEvent(accomadationPreference));
      },
      errorText: displayError != null ? 'Invalid Accomadation Preference' : null,
    );
  }
}

class _ReturnDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.returnDate.displayError,
    );
    return CustomTextField(
      labelText: 'Return Date',
      key: const Key('dobInput_textField'),
      onChanged: (returnDate) {
        context.read<TravelPreferenceBloc>().add(ReturnDateChangedEvent(returnDate));
      },
      errorText: displayError != null ? 'Invalid Return Date' : null,
    );
  }
}

class _DepartureDate extends StatelessWidget {
  const _DepartureDate();

  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (TravelPreferenceBloc bloc) => bloc.state.departureDate.displayError,
    );
    return CustomTextField(
      labelText: 'Departure Date',
      key: const Key('departure_date_Input_textField'),
      onChanged: (departureDate) {
        context.read<TravelPreferenceBloc>().add(DepartureDateChangedEvent(departureDate));
      },
      errorText: displayError != null ? 'Invalid Departure Date' : null,
    );
  }
}
