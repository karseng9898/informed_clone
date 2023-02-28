import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'widgets/continue_button.dart';
import '../../widgets/action_button.dart';

import '../../constants/spacings.dart';
import '../../widgets/divider_with_text.dart';
import 'bloc/onboarding_screen_bloc.dart';
import 'widgets/email_input.dart';
import 'widgets/third_party_sign_in_buttons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    _emailFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingScreenBloc(),
      child: Scaffold(
        body: SafeArea(
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacings.padding),
              child: Column(children: [
                const SizedBox(height: AppSpacings.xl4 * 3),
                getTitleLabel(context),
                const SizedBox(height: AppSpacings.sm),
                getDescriptionLabel(context),
                const SizedBox(height: AppSpacings.xl4),
                Visibility(
                  visible: !_emailFocus.hasFocus,
                  child: Column(
                    children: [
                      ThirdPartySignInButtons(
                        onSignInPressed: (signInMethods) {},
                      ),
                      const DividerWithText(
                        title: "Or continue with",
                        verticalMargin: AppSpacings.xl,
                      ),
                    ],
                  ),
                ),
                EmailInput(focusNode: _emailFocus),
              ]),
            ),
          ),
        ),
        bottomSheet: _emailFocus.hasFocus ? const ContinueButton() : null,
      ),
    );
  }
}

// * Widget Factories
extension _WidgetFactories on _OnboardingScreenState {
  Widget getTitleLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Text(
        _Strings.titleText,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget getDescriptionLabel(BuildContext context) {
    return Text(
      _Strings.descriptionText,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}

class _Strings {
  static const titleText = "Welcome to informed";

  static const descriptionText =
      "Sign up or log in below to access world-class journalism from premium publishers, curated by editors & experts.";
}
