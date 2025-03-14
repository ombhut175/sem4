import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecture_work/utils/string_const.dart';

class UserEntryPage extends StatefulWidget {
  Map<String, dynamic>? userDetail = {};

  UserEntryPage({super.key, this.userDetail});

  @override
  State<UserEntryPage> createState() => _UserEntryPage();
}

class _UserEntryPage extends State<UserEntryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isRegisterPageVisible = true;
  List<String> cities = ["Rajkot", "Ahmedabad", "Vadodra"];
  String selectedCity = "";
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    selectedCity = widget.userDetail == null
        ? cities[0]
        : widget.userDetail![CITY].toString();
    if (widget.userDetail != null) {
      nameController.text = widget.userDetail![NAME].toString();
      ageController.text = widget.userDetail![AGE].toString();
      emailController.text = widget.userDetail![EMAIL].toString();
    }
  }

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
                  text: "enter age",
                  forWhatValue: "age",
                  controller: ageController),
              const SizedBox(height: 10),
              inputTextField(
                text: "enter email",
                forWhatValue: "email",
                controller: emailController,
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                  value: selectedCity,
                  items: cities.map((city) {
                    return DropdownMenuItem(
                        value: city, child: Text(city.toString()));
                  }).toList(),
                  onChanged: (value) {
                    selectedCity = value.toString();
                    setState(() {});
                  }),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(200, 60),
                  ),
                  onPressed: () {
                    Map<String, dynamic> data = {};
                    data[NAME] = nameController.text.toString();
                    data[EMAIL] = emailController.text.toString();
                    data[AGE] = ageController.text.toString();
                    data[CITY] = selectedCity.toString();
                    Navigator.pop(context, data);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(
                height: 20,
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
