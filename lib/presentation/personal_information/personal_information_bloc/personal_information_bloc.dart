import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/models/personal_info_model.dart';
import 'package:formz/formz.dart';

part 'personal_information_event.dart';
part 'personal_information_state.dart';

class PersonalInformationBloc extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  PersonalInformationBloc() : super(PersonalInformationState()){
    on<FullNameChangedEvent>(_onFullNameChanged);
    on<DobChangedEvent>(_onDobChanged);
    on<NationalityChangedEvent>(_onNationalityChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PhoneChangedEvent>(_onPhoneChanged);
    on<NextFormEvent>(_onNextForm);
  }

  Future<void> _onFullNameChanged(
    FullNameChangedEvent event,
    Emitter<PersonalInformationState> emit,
  ) async {
    final fullName = FormField.dirty(event.fullName);
    emit(
      state.copyWith(
        fullName: fullName,
        isValid: Formz.validate([fullName, state.dob,state.nationality,state.email,state.phone]),
      ),
    );
  }

  Future<void> _onDobChanged(
    DobChangedEvent event,
    Emitter<PersonalInformationState> emit,
  ) async {
    final dob = FormField.dirty(event.dob);
    emit(
      state.copyWith(
        dob: dob,
        isValid: Formz.validate([state.fullName,dob,state.nationality,state.email,state.phone]),
      ),
    );
  }

  Future<void> _onNationalityChanged(
    NationalityChangedEvent event,
    Emitter<PersonalInformationState> emit,
  ) async {
    final nationality = FormField.dirty(event.nationality);
    emit(
      state.copyWith(
        nationality: nationality,
        isValid: Formz.validate([state.fullName, state.dob,nationality,state.email,state.phone]),
      ),
    );
  }

  Future<void> _onEmailChanged(
    EmailChangedEvent event,
    Emitter<PersonalInformationState> emit,
  ) async {
    final email = FormField.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([state.fullName, state.dob,state.nationality,email,state.phone]),
      ),
    );
  }
  Future<void> _onPhoneChanged(
    PhoneChangedEvent event,
    Emitter<PersonalInformationState> emit,
  ) async {
    final phone = FormField.dirty(event.phone);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([state.fullName,state.dob,state.nationality,state.email,phone]),
      ),
    );
  }

  Future<void> _onNextForm(
    NextFormEvent event,
    Emitter<PersonalInformationState> emit,
  ) async {
    // if (state.isValid) {
    //   emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    //   try {
    //     // await _authenticationRepository.logIn(
    //     //   username: state.username.value,
    //     //   password: state.password.value,
    //     // );
    //     emit(state.copyWith(status: FormzSubmissionStatus.success));
    //   } catch (_) {
    //     emit(state.copyWith(status: FormzSubmissionStatus.failure));
    //   }
    // }
  }
}
