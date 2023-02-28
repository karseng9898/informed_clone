part of 'onboarding_screen_bloc.dart';

abstract class OnboardingScreenEvent extends Equatable {
  const OnboardingScreenEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends OnboardingScreenEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}


class FormSubmitted extends OnboardingScreenEvent {}
