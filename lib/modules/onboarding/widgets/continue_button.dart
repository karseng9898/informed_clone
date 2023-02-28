import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../constants/spacings.dart';
import '../../../widgets/action_button.dart';
import '../bloc/onboarding_screen_bloc.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _Styles.padding,
      child: BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
        builder: (context, state) {
          return ActionButton(
            title: "Continue",
            isSubmitting: state.isSubmitting,
            block: true,
            onPressed: onPressed(state, context),
          );
        },
      ),
    );
  }
}

// * ----------------------- Actions --------------------
extension _Actions on ContinueButton {
  VoidCallback? onPressed(
    OnboardingScreenState state,
    BuildContext context,
  ) {
    return state.status.isValid
        ? () => context.read<OnboardingScreenBloc>().add(FormSubmitted())
        : null;
  }
}

class _Styles {
  static const padding = EdgeInsets.symmetric(
    horizontal: AppSpacings.padding,
    vertical: AppSpacings.md,
  );
}
