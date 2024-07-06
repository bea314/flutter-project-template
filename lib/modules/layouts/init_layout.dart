import 'package:flutter/material.dart';

class InitLayout extends StatelessWidget {
  const InitLayout({
    Key? key,
    required this.child
  }) : super(key: key ?? const ValueKey('InitLayoutKey'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child
      ),
    );
  }
}