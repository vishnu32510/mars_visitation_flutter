import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mars_visitation/presentation/personal_information/models/personal_info_model.dart';
import 'package:formz/formz.dart';
part 'travel_preferecne_event.dart';
part 'travel_preferecne_state.dart';

class TravelPreferenceBloc extends Bloc<TravelPreferenceEvent, TravelPreferenceState> {
  TravelPreferenceBloc() : super(TravelPreferenceState()){
    on<DepartureDateChangedEvent>(_onDepartureDateChanged);
    on<ReturnDateChangedEvent>(_onReturnDateChanged);
    on<AccomadationPreferenceChangedEvent>(_onAccomadationPreferenceChanged);
    on<SpecialRequestChangedEvent>(_onSpecialRequestChanged);
    on<NextFormEvent>(_onNextForm);
    on<PrevFormEvent>(_onPrevForm);
  }

  Future<void> _onDepartureDateChanged(
    DepartureDateChangedEvent event,
    Emitter<TravelPreferenceState> emit,
  ) async {
    final departureDate = FormField.dirty(event.departureDate);
    emit(
      state.copyWith(
        departureDate: departureDate,
        isValid: Formz.validate([departureDate, state.returnDate,state.accomadationPreference,state.specialRequest]),
      ),
    );
  }

  Future<void> _onReturnDateChanged(
    ReturnDateChangedEvent event,
    Emitter<TravelPreferenceState> emit,
  ) async {
    final returnDate = FormField.dirty(event.returnDate);
    emit(
      state.copyWith(
        returnDate: returnDate,
        isValid: Formz.validate([state.departureDate,returnDate,state.accomadationPreference,state.specialRequest]),
      ),
    );
  }

  Future<void> _onAccomadationPreferenceChanged(
    AccomadationPreferenceChangedEvent event,
    Emitter<TravelPreferenceState> emit,
  ) async {
    final accomadationPreference = FormField.dirty(event.accomadationPreference);
    emit(
      state.copyWith(
        accomadationPreference: accomadationPreference,
        isValid: Formz.validate([state.departureDate,state.returnDate,accomadationPreference,state.specialRequest]),
      ),
    );
  }

  Future<void> _onSpecialRequestChanged(
    SpecialRequestChangedEvent event,
    Emitter<TravelPreferenceState> emit,
  ) async {
    final specialRequest = FormField.dirty(event.specialRequest);
    emit(
      state.copyWith(
        specialRequest: specialRequest,
        isValid: Formz.validate([state.departureDate,state.returnDate,state.accomadationPreference,specialRequest]),
      ),
    );
  }

  Future<void> _onNextForm(
    NextFormEvent event,
    Emitter<TravelPreferenceState> emit,
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
    Emitter<TravelPreferenceState> emit,
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
