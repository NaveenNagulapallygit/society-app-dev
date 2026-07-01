import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;
  final BuildContext context;
  final bool isLast;
  final bool isFirst;
  const OtpTextField({
    super.key,
    required this.controller,
    required this.context,
    this.isLast = false,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value){
          if(value.isNotEmpty && !isLast) {
            FocusScope.of(this.context).nextFocus();
          }
          if(value.isEmpty && !isFirst) {
            FocusScope.of(this.context).previousFocus();
          }
        },
      ),
    );
  }
}
