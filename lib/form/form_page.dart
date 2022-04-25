import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validate_flutter/Validate/validate.dart';
import 'package:validate_flutter/form/email_form.dart';
import 'custom_form_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var _text = '';
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  // use the getter variable defined above
                  errorText: _errorText,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidName) return 'Enter valid name';
                  return null;
                },
                onChanged: (text) => setState(() => _text),
              ),
              // const EmailForm(
              //   // keyboardType: TextInputType.emailAddress,
              //   // hintText: 'Email',
              //   // validator: (val) {
              //   //   if (!val!.isValidEmail) return 'Enter valid email';
              //   //   return null;
              //   // },
              // ),
              const CustomFormField().add(),
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
