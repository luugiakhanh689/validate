import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
   const CustomFormField({
    Key? key,
    this.keyboardType,
    this.errTexts,
    this.hintText,
    this.inputFormatters,
    this.validator,
    this.obscureText,
  }) : super(key: key);

  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? errTexts;

  @override
  State<CustomFormField> createState() => CustomFormFieldState();

  emailForm() {}
}

class CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        decoration: InputDecoration(hintText: widget.hintText, errorText: widget.errTexts),
      ),
    );
  }
}
