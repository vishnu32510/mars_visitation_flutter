part of 'health_and_safety_bloc.dart';

final class HealthAndSafetyState extends Equatable {
  const HealthAndSafetyState({
    this.status = FormzSubmissionStatus.initial,
    this.healthDeclaration = const FormField.pure(),
    this.emergencyContact = const FormField.pure(),
    this.medicalConditions = const FormField.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final FormField healthDeclaration;
  final FormField emergencyContact;
  final FormField medicalConditions;
  final bool isValid;

  HealthAndSafetyState copyWith({
    FormzSubmissionStatus? status,
    FormField? healthDeclaration,
    FormField? emergencyContact,
    FormField? medicalConditions,
    bool? isValid,
  }) {
    return HealthAndSafetyState(
      status: status ?? this.status,
      healthDeclaration: healthDeclaration ?? this.healthDeclaration,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      medicalConditions: medicalConditions ?? this.medicalConditions,
      isValid: isValid ?? this.isValid,
    );
  }

  
  @override
  List<Object> get props => [status,healthDeclaration,emergencyContact,medicalConditions];
}
