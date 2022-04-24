import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validate_flutter/Validate/validate.dart';
import 'custom_form_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState();
}
class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Name',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidName) return 'Enter valid name';
                  return null;
                },
              ),
              CustomFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                validator: (val) {
                  if (!val!.isValidEmail) return 'Enter valid email';
                  return null;
                },
              ),
              CustomFormField(
                keyboardType: TextInputType.number,
                hintText: 'Phone',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidPhone) return 'Enter valid phone';
                  return null;
                },
              ),
              CustomFormField(
                obscureText: true,
                hintText: 'Password',
                validator: (val) {
                  if (!val!.isValidPassword) return 'Enter valid password';
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                  FocusScope.of(context).unfocus();
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
