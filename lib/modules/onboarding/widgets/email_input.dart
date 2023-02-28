import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/spacings.dart';
import '../bloc/onboarding_screen_bloc.dart';

class EmailInput extends StatelessWidget {
  final FocusNode focusNode;

  const EmailInput({
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
            focusNode: focusNode,
            initialValue: state.email.value,
            onChanged: (value) => context
                .read<OnboardingScreenBloc>()
                .add(EmailChanged(email: value)),
            onEditingComplete: () =>
                FocusManager.instance.primaryFocus?.unfocus(),
            decoration: _Styles.inputDecoration);
      },
    );
  }
}

class _Styles {
  static const inputDecoration = InputDecoration(
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
  );
}
