import 'package:flutter/material.dart';

class ThirdPartySignInButton extends StatelessWidget {
  const ThirdPartySignInButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconImage,
  });

  final void Function() onPressed;
  final String title;
  final ImageProvider iconImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        icon: Image(image: iconImage, width: 20, height: 20),
        label: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        onPressed: onPressed,
      ),
    );
  }
}
