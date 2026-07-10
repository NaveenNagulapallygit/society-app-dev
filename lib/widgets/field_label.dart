import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String title;
  final bool isRequired;

  const FieldLabel({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.color,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isRequired)
             TextSpan(
              text: " *",
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}