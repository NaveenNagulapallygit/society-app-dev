import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.nextFocus,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      maxLines: obscureText ? 1: maxLines,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: (_) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          } else {
            FocusScope.of(context).unfocus();
          }
          },
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          contentPadding:  EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
    );
  }
}
