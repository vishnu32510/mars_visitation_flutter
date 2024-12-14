part of 'personal_information_bloc.dart';

final class PersonalInformationState extends Equatable {
  const PersonalInformationState({
    this.status = FormzSubmissionStatus.initial,
    this.fullName = const FormField.pure(),
    this.dob = const FormField.pure(),
    this.nationality = const FormField.pure(),
    this.email = const FormField.pure(),
    this.phone = const FormField.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final FormField fullName;
  final FormField dob;
  final FormField nationality;
  final FormField email;
  final FormField phone;
  final bool isValid;

  PersonalInformationState copyWith({
    FormzSubmissionStatus? status,
    FormField? fullName,
    FormField? dob,
    FormField? nationality,
    FormField? email,
    FormField? phone,
    bool? isValid,
  }) {
    return PersonalInformationState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      dob: dob ?? this.dob,
      nationality: nationality ?? this.nationality,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
    );
  }

  
  @override
  List<Object> get props => [status,fullName,dob,nationality,email,phone];
}
