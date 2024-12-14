import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mars_visitation/core/utils/app_assets.dart';
import 'package:flutter_mars_visitation/presentation/dashboard.dart';
import 'package:flutter_mars_visitation/presentation/health_and_safety/health_and_safety/health_and_safety_bloc.dart';
import 'package:flutter_mars_visitation/presentation/success.dart';
import 'package:flutter_mars_visitation/presentation/widgets/custom_text_field.dart';
import 'package:flutter_mars_visitation/presentation/widgets/page_move_button.dart';
import 'package:flutter_mars_visitation/presentation/widgets/theme_button.dart';
import 'package:formz/formz.dart';

class HealthAndSafety extends StatelessWidget {
  static const String routeName = '/HealthAndSafety';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (context) => HealthAndSafety());
  }

  const HealthAndSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ThemeHeader(),
      body: BlocConsumer<HealthAndSafetyBloc, HealthAndSafetyState>(
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
          return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      LottieImageDisplay(name: AppAssets.lottie3,),

            DisplayPages(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Health And Safety',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.primary),
                    ),
                    _HealthAndDeclaration(),
                    _EmergencyContact(),
                    _MedicalConditions(),
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
                          buttonText: "Submit",
                          isValid: state.isValid,
                          onPressed: () {
                            Navigator.pushNamed(context, SuccessPage.routeName);
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

class _MedicalConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (HealthAndSafetyBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (HealthAndSafetyBloc bloc) => bloc.state.medicalConditions.displayError,
    );
    return CustomTextField(
      labelText: 'Medical Conditions',
      key: const Key('nationalityInput_textField'),
      onChanged: (medicalConditions) {
        context.read<HealthAndSafetyBloc>().add(MedicalConditionsChangedEvent(medicalConditions));
      },
      errorText: displayError != null ? 'Invalid Medical Information' : null,
    );
  }
}

class _EmergencyContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (HealthAndSafetyBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (HealthAndSafetyBloc bloc) => bloc.state.emergencyContact.displayError,
    );
    return CustomTextField(
      labelText: 'Emergency Conatct Information',
      key: const Key('emergency_contact_Input_textField'),
      onChanged: (emergencyContact) {
        context.read<HealthAndSafetyBloc>().add(EmergencyContactChangedEvent(emergencyContact));
      },
      errorText: displayError != null ? 'Invalid Emergency Conatct Information' : null,
    );
  }
}

class _HealthAndDeclaration extends StatelessWidget {
  const _HealthAndDeclaration();

  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (HealthAndSafetyBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final displayError = context.select(
      (HealthAndSafetyBloc bloc) => bloc.state.healthDeclaration.displayError,
    );
    return CustomTextField(
      labelText: 'Health Declaration',
      key: const Key('health_and_declaration_Input_textField'),
      onChanged: (healthDeclaration) {
        context.read<HealthAndSafetyBloc>().add(HealthDeclarationChangedEvent(healthDeclaration));
      },
      errorText: displayError != null ? 'Invalid Declaration' : null,
    );
  }
}
