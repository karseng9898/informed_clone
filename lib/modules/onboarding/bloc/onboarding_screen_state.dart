part of 'onboarding_screen_bloc.dart';

class OnboardingScreenState extends Equatable {
  final Email email;
  final FormzStatus status;

  const OnboardingScreenState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
  });

  OnboardingScreenState copyWith({
    Email? email,
    FormzStatus? status,
  }) {
    return OnboardingScreenState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email, status];
}
