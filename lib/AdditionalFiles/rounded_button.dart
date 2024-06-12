// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  final child;
  final onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: secondaryColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          12,
        ),
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        minWidth: width,
        height: height,
        child: child,
      ),
    );
  }
}
