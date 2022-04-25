import 'package:flutter/services.dart';

class Input {
  FilteringTextInputFormatter inputFormatUserName() {
     final nameRegExp = FilteringTextInputFormatter.allow(
      RegExp(r"[a-zA-Z]+|\s"),
    );
    return nameRegExp;
  }
}
