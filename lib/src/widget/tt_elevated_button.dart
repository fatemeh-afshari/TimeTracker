import 'package:flutter/material.dart';

class TTElevatedButton extends StatelessWidget {
  final Widget child;
  final Color mainColor;
  final Color borderColor;
  final Color? textColor;
  final double cornerRadius;
  final void Function()? onPressed;
  final double elevation;
  final double padding;

  TTElevatedButton({
    required this.mainColor,
    this.textColor,
    this.borderColor = Colors.transparent,
    this.cornerRadius = 0.0,
    this.onPressed,
    this.elevation = 10.0,
    this.padding = 10.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        primary: mainColor,
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: child,
      ),
    );
  }
}