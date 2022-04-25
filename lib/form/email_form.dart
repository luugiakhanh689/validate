import 'package:flutter/services.dart';
import 'package:validate_flutter/Validate/validate.dart';
import 'package:validate_flutter/form/custom_form_field.dart';

extension Builder on CustomFormField {
  CustomFormField add() {
    return  CustomFormField(
        keyboardType: TextInputType.emailAddress,
        hintText: 'Email',
        validator: (val) {
                  if (!val!.isValidEmail) return 'Enter valid email';
                  return null;
                },
      );
  }
}