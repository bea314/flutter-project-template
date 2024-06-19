import 'package:flutter/material.dart';

class SystemLayout extends StatelessWidget {
  const SystemLayout({
    Key? key,
    required this.child
  }) : super(key: key ?? const ValueKey('SystemLayoutKey'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}