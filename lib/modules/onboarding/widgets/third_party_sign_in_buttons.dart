import 'package:flutter/widgets.dart';

import '../../../constants/icons.dart';
import '../../../constants/spacings.dart';
import 'third_party_sign_in_button.dart';

enum ThirdPartySignInMethods {
  google,
  apple,
  linkedin;
}

class ThirdPartySignInButtons extends StatelessWidget {
  final void Function(ThirdPartySignInMethods signInMethods) onSignInPressed;

  const ThirdPartySignInButtons({
    super.key,
    required this.onSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        children: [
          ThirdPartySignInButton(
            title: "Sign in with Google",
            iconImage: AppIcons.googleIcon,
            onPressed: () => onSignInPressed(ThirdPartySignInMethods.google),
          ),
          const SizedBox(height: AppSpacings.md),
          ThirdPartySignInButton(
            title: "Sign in with Apple",
            iconImage: AppIcons.appleIcon,
            onPressed: () => onSignInPressed(ThirdPartySignInMethods.apple),
          ),
          const SizedBox(height: AppSpacings.md),
          ThirdPartySignInButton(
            title: "Sign in with LinkedIn",
            iconImage: AppIcons.linkedinIcon,
            onPressed: () => onSignInPressed(ThirdPartySignInMethods.linkedin),
          ),
        ],
      ),
    );
  }
}
