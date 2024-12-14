import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mars_visitation/presentation/health_and_safety/models/health_and_safety_model.dart';
import 'package:formz/formz.dart';
part 'health_and_safety_event.dart';
part 'health_and_safety_state.dart';

class HealthAndSafetyBloc extends Bloc<HealthAndSafetyEvent, HealthAndSafetyState> {
  HealthAndSafetyBloc() : super(HealthAndSafetyState()){
    on<HealthDeclarationChangedEvent>(_onHealthDeclarationChanged);
    on<EmergencyContactChangedEvent>(_onEmergencyContactChanged);
    on<MedicalConditionsChangedEvent>(_onMedicalConditionsChanged);
    on<SubmitFormEvent>(_onSubmitForm);
    on<PrevFormEvent>(_onPrevForm);
  }

  Future<void> _onHealthDeclarationChanged(
    HealthDeclarationChangedEvent event,
    Emitter<HealthAndSafetyState> emit,
  ) async {
    final healthDeclaration = FormField.dirty(event.healthDeclaration);
    emit(
      state.copyWith(
        healthDeclaration: healthDeclaration,
        isValid: Formz.validate([healthDeclaration, state.emergencyContact,state.medicalConditions]),
      ),
    );
  }

  Future<void> _onEmergencyContactChanged(
    EmergencyContactChangedEvent event,
    Emitter<HealthAndSafetyState> emit,
  ) async {
    final emergencyContact = FormField.dirty(event.emergencyContact);
    emit(
      state.copyWith(
        emergencyContact: emergencyContact,
        isValid: Formz.validate([state.healthDeclaration,emergencyContact,state.medicalConditions]),
      ),
    );
  }

  Future<void> _onMedicalConditionsChanged(
    MedicalConditionsChangedEvent event,
    Emitter<HealthAndSafetyState> emit,
  ) async {
    final medicalConditions = FormField.dirty(event.medicalConditions);
    emit(
      state.copyWith(
        medicalConditions: medicalConditions,
        isValid: Formz.validate([state.healthDeclaration,state.emergencyContact,medicalConditions]),
      ),
    );
  }

  Future<void> _onSubmitForm(
    SubmitFormEvent event,
    Emitter<HealthAndSafetyState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        // await _authenticationRepository.logIn(
        //   username: state.username.value,
        //   password: state.password.value,
        // );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  Future<void> _onPrevForm(
    PrevFormEvent event,
    Emitter<HealthAndSafetyState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        // await _authenticationRepository.logIn(
        //   username: state.username.value,
        //   password: state.password.value,
        // );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
