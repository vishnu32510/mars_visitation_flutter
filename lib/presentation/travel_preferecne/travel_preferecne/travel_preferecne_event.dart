part of 'travel_preferecne_bloc.dart';

abstract class TravelPreferenceEvent extends Equatable {
  const TravelPreferenceEvent();

  @override
  List<Object> get props => [];
}

final class DepartureDateChangedEvent extends TravelPreferenceEvent {
  const DepartureDateChangedEvent(this.departureDate);

  final String departureDate;

  @override
  List<Object> get props => [departureDate];
}

final class ReturnDateChangedEvent extends TravelPreferenceEvent {
  const ReturnDateChangedEvent(this.returnDate);

  final String returnDate;

  @override
  List<Object> get props => [returnDate];
}

final class AccomadationPreferenceChangedEvent extends TravelPreferenceEvent {
  const AccomadationPreferenceChangedEvent(this.accomadationPreference);

  final String accomadationPreference;

  @override
  List<Object> get props => [accomadationPreference];
}

final class SpecialRequestChangedEvent extends TravelPreferenceEvent {
  const SpecialRequestChangedEvent(this.specialRequest);

  final String specialRequest;

  @override
  List<Object> get props => [specialRequest];
}

final class NextFormEvent extends TravelPreferenceEvent {
  const NextFormEvent();
}

final class PrevFormEvent extends TravelPreferenceEvent {
  const PrevFormEvent();
}