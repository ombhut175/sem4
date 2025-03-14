import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecture_work/utils/string_const.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isRegisterPageVisible = true;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              inputTextField(
                  text: "enter name",
                  controller: nameController,
                  forWhatValue: "name"),
              const SizedBox(height: 10),
              inputTextField(
                  text: "enter password",
                  controller: passwordController,
                  forWhatValue: "password"),
              const SizedBox(height: 10),
              Visibility(
                visible: isRegisterPageVisible,
                child: inputTextField(
                    text: "confirm password",
                    controller: confirmPasswordController,
                    forWhatValue: "confirm password"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(200, 60),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                      "ARE YOU ${isRegisterPageVisible ? LOGIN_TEXT : REGISTER_TEXT}ED USER"),
                  InkWell(
                    onTap: () {
                      isRegisterPageVisible = !isRegisterPageVisible;
                      setState(() {});
                    },
                    child: Text(
                      isRegisterPageVisible ? LOGIN_TEXT : REGISTER_TEXT,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
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
      ),
    );
  }
}
