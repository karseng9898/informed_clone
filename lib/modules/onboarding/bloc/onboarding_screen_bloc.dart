import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:informed_clone/models/formz/email.dart';

part 'onboarding_screen_event.dart';
part 'onboarding_screen_state.dart';

class OnboardingScreenBloc
    extends Bloc<OnboardingScreenEvent, OnboardingScreenState> {
  OnboardingScreenBloc() : super(const OnboardingScreenState()) {
    on<EmailChanged>(_onEmailChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<OnboardingScreenState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email]),
      ),
    );
  }

  void _onFormSubmitted(
    FormSubmitted event,
    Emitter<OnboardingScreenState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(milliseconds: 1500), () {
      emit(state.copyWith(isSubmitting: false));
    });
  }
}
