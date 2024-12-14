part of 'health_and_safety_bloc.dart';

abstract class HealthAndSafetyEvent extends Equatable {
  const HealthAndSafetyEvent();

  @override
  List<Object> get props => [];
}

final class HealthDeclarationChangedEvent extends HealthAndSafetyEvent {
  const HealthDeclarationChangedEvent(this.healthDeclaration);

  final String healthDeclaration;

  @override
  List<Object> get props => [healthDeclaration];
}

final class EmergencyContactChangedEvent extends HealthAndSafetyEvent {
  const EmergencyContactChangedEvent(this.emergencyContact);

  final String emergencyContact;

  @override
  List<Object> get props => [emergencyContact];
}

final class MedicalConditionsChangedEvent extends HealthAndSafetyEvent {
  const MedicalConditionsChangedEvent(this.medicalConditions);

  final String medicalConditions;

  @override
  List<Object> get props => [medicalConditions];
}

final class SubmitFormEvent extends HealthAndSafetyEvent {
  const SubmitFormEvent();
}

final class PrevFormEvent extends HealthAndSafetyEvent {
  const PrevFormEvent();
}