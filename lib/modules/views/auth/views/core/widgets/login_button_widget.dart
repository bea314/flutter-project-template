import 'package:flutter/material.dart';

import '../../../../../../core/styles.dart';

class WidgetLoginButton extends StatelessWidget {
  const WidgetLoginButton({
    super.key,
    required this.title,
    required this.onPress,
    this.disabled = false,
    this.loading = false,
  });
  final bool disabled;
  final bool loading;

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: disabled
              ? SystemColors.grey80.withOpacity(0.6)
              : SystemColors.grey20,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        onPressed: disabled
            ? null
            : () {
                onPress();
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!loading)
              Text(
                title,
                style: TextStyle(
                  color: disabled
                      ? SystemColors.grey40.withOpacity(0.5)
                      : SystemColors.bluePrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (loading) ...[
              const SizedBox(width: 10),
              const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(),
              )
            ]
          ],
        ),
      ),
    );
  }
}
