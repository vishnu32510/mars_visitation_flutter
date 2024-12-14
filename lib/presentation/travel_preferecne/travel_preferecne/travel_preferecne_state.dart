part of 'travel_preferecne_bloc.dart';

final class TravelPreferenceState extends Equatable {
  const TravelPreferenceState({
    this.status = FormzSubmissionStatus.initial,
    this.departureDate = const FormField.pure(),
    this.returnDate = const FormField.pure(),
    this.accomadationPreference = const FormField.pure(),
    this.specialRequest = const FormField.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final FormField departureDate;
  final FormField returnDate;
  final FormField accomadationPreference;
  final FormField specialRequest;
  final bool isValid;

  TravelPreferenceState copyWith({
    FormzSubmissionStatus? status,
    FormField? departureDate,
    FormField? returnDate,
    FormField? accomadationPreference,
    FormField? specialRequest,
    bool? isValid,
  }) {
    return TravelPreferenceState(
      status: status ?? this.status,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      accomadationPreference: accomadationPreference ?? this.accomadationPreference,
      specialRequest: specialRequest ?? this.specialRequest,
      isValid: isValid ?? this.isValid,
    );
  }

  
  @override
  List<Object> get props => [status,departureDate,returnDate,accomadationPreference,specialRequest];
}
