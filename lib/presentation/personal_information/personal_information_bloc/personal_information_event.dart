part of 'personal_information_bloc.dart';

abstract class PersonalInformationEvent extends Equatable {
  const PersonalInformationEvent();

  @override
  List<Object> get props => [];
}

final class FullNameChangedEvent extends PersonalInformationEvent {
  const FullNameChangedEvent(this.fullName);

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

final class DobChangedEvent extends PersonalInformationEvent {
  const DobChangedEvent(this.dob);

  final String dob;

  @override
  List<Object> get props => [dob];
}

final class NationalityChangedEvent extends PersonalInformationEvent {
  const NationalityChangedEvent(this.nationality);

  final String nationality;

  @override
  List<Object> get props => [nationality];
}

final class EmailChangedEvent extends PersonalInformationEvent {
  const EmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class PhoneChangedEvent extends PersonalInformationEvent {
  const PhoneChangedEvent(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

final class NextFormEvent extends PersonalInformationEvent {
  const NextFormEvent();
}
