part of 'onboarding_screen_bloc.dart';

class OnboardingScreenState extends Equatable {
  final Email email;
  final FormzStatus status;
  final bool isSubmitting;

  const OnboardingScreenState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
    this.isSubmitting = false,
  });

  OnboardingScreenState copyWith({
    Email? email,
    FormzStatus? status,
    bool? isEmailFocused,
    bool? isSubmitting,
  }) {
    return OnboardingScreenState(
      email: email ?? this.email,
      status: status ?? this.status,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [email, status, isSubmitting];
}
