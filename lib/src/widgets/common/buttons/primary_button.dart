import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onClick,
    required this.label,
  });
  final Function() onClick;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          // padding:
          //     const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0), // Padding
        ),
        child: Text(label));
  }
}
