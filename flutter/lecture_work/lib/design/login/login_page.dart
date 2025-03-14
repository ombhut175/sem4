import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Login Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              inputTextField(
                text: 'Enter your name',
                controller: nameController,
                forWhatValue: 'Name',
                iconForValues: Icon(
                  Icons.close,
                  size: 16,
                ),
                fillColor: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
              inputTextField(
                text: 'Enter Email',
                controller: emailController,
                forWhatValue: 'Email',
                regxPattern:
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                inputFormaters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[A-Z]')),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              inputTextField(
                text: 'Enter password',
                controller: passwordController,
                forWhatValue: 'Password',
                inputFormaters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  print('isValid ${_formKey.currentState!.validate()}');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputTextField({
    required String text,
    TextEditingController? controller,
    String? forWhatValue,
    String? regxPattern,
    Icon? iconForValues,
    Color? fillColor,
    TextInputType? textInputType,
    List<FilteringTextInputFormatter>? inputFormaters,
  }) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Valid $forWhatValue';
        }
        if (!RegExp(regxPattern ?? '').hasMatch(value)) {
          return 'Enter Valid $forWhatValue';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: iconForValues,
        ),
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      keyboardType: textInputType,
      inputFormatters: inputFormaters,
    );
  }
}
