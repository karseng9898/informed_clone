import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/icons.dart';
import '../../constants/spacings.dart';
import '../../widgets/divider_with_text.dart';
import 'bloc/onboarding_screen_bloc.dart';
import 'widgets/third_party_sign_in_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
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
                  visible: !_emailFocusNode.hasFocus,
                  child: Column(
                    children: [
                      getThirdPartySignInButtons(),
                      const DividerWithText(
                        title: "Or continue with",
                        verticalMargin: AppSpacings.xl,
                      ),
                    ],
                  ),
                ),
                EmailInput(focusNode: _emailFocusNode),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: _emailFocusNode.hasFocus
            ? BottomAppBar(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Continue"),
                ),
              )
            : null,
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

  Widget getThirdPartySignInButtons() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        children: [
          ThirdPartySignInButton(
            title: "Sign in with Google",
            iconImage: AppIcons.googleIcon,
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacings.md),
          ThirdPartySignInButton(
            title: "Sign in with Apple",
            iconImage: AppIcons.appleIcon,
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacings.md),
          ThirdPartySignInButton(
            title: "Sign in with LinkedIn",
            iconImage: AppIcons.linkedinIcon,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final FocusNode focusNode;

  const EmailInput({
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode,
          initialValue: state.email.value,
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          onEditingComplete: () => focusNode.unfocus(),
          decoration: const InputDecoration(
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacings.xl,
              vertical: AppSpacings.lg,
            ),
            hintText: "Email Address",
          ),
        );
      },
    );
  }
}

class _Strings {
  static const titleText = "Welcome to informed";

  static const descriptionText =
      "Sign up or log in below to access world-class journalism from premium publishers, curated by editors & experts.";
}
