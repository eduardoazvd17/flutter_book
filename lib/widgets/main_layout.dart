import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  MainLayout({@required this.child});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
