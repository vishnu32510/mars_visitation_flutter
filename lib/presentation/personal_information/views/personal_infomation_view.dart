import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mars_visitation/core/utils/app_assets.dart';
import 'package:flutter_mars_visitation/presentation/dashboard.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/personal_information_bloc/personal_information_bloc.dart';
import 'package:flutter_mars_visitation/presentation/travel_preferecne/views/travel_preferecne_view.dart';
import 'package:flutter_mars_visitation/presentation/widgets/background_wrapper.dart';
import 'package:flutter_mars_visitation/presentation/widgets/custom_text_field.dart';
import 'package:flutter_mars_visitation/presentation/widgets/page_move_button.dart';
import 'package:flutter_mars_visitation/presentation/widgets/theme_button.dart';
import 'package:formz/formz.dart';

class PersonalInformation extends StatelessWidget {
  static const String routeName = '/personalInformation';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => PersonalInformation());
  }

  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ThemeHeader(),
        body: BackgroundWrapper(
          child: BlocConsumer<PersonalInformationBloc, PersonalInformationState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                DisplayPages(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Personal Information',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        _FullName(),
                        _Dob(),
                        _Nationality(),
                        _Email(),
                        _Phone(),
                        PageMoveButton(
                          buttonText: 'Next Page',
                          isValid: state.isValid,
                          onPressed: () {
                            Navigator.pushNamed(context, TravelPreferecne.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                LottieImageDisplay(
                  name: AppAssets.lottie1,
                ),
              ]);
            },
          ),
        ));
  }
}

class _Phone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (PersonalInformationBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (PersonalInformationBloc bloc) => bloc.state.phone.displayError,
    );
    return CustomTextField(
      labelText: 'Phone',
      key: const Key('phoneInput_textField'),
      onChanged: (phone) {
        context.read<PersonalInformationBloc>().add(PhoneChangedEvent(phone));
      },
      errorText: displayError != null ? 'Invalid Phone' : null,
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (PersonalInformationBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (PersonalInformationBloc bloc) => bloc.state.email.displayError,
    );
    return CustomTextField(
      labelText: 'Email',
      key: const Key('emailInput_textField'),
      onChanged: (email) {
        context.read<PersonalInformationBloc>().add(EmailChangedEvent(email));
      },
      errorText: displayError != null ? 'Invalid Email' : null,
    );
  }
}

class _Nationality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (PersonalInformationBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (PersonalInformationBloc bloc) => bloc.state.nationality.displayError,
    );
    return CustomTextField(
      labelText: 'Nationality',
      key: const Key('nationalityInput_textField'),
      onChanged: (nationality) {
        context.read<PersonalInformationBloc>().add(NationalityChangedEvent(nationality));
      },
      errorText: displayError != null ? 'Invalid Nationality' : null,
    );
  }
}

class _Dob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (PersonalInformationBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (PersonalInformationBloc bloc) => bloc.state.dob.displayError,
    );
    return CustomTextField(
      labelText: 'Date of Birth',
      key: const Key('dobInput_textField'),
      onChanged: (dob) {
        context.read<PersonalInformationBloc>().add(DobChangedEvent(dob));
      },
      errorText: displayError != null ? 'Invalid Date of Birth' : null,
    );
  }
}

class _FullName extends StatelessWidget {
  const _FullName();

  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (PersonalInformationBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (PersonalInformationBloc bloc) => bloc.state.fullName.displayError,
    );
    return CustomTextField(
      labelText: 'Full Name',
      key: const Key('fullanemInput_textField'),
      onChanged: (fullName) {
        context.read<PersonalInformationBloc>().add(FullNameChangedEvent(fullName));
      },
      errorText: displayError != null ? 'Invalid Full Name' : null,
    );
  }
}
