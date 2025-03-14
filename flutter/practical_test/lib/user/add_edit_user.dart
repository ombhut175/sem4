import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical_test/user_management/user.dart';
import 'package:practical_test/user_management/user_api.dart';
import 'package:practical_test/utils/string_const.dart';

class AddEditUser extends StatefulWidget {
  Map<String, dynamic>? user;
  bool isEditPage;

  AddEditUser({super.key, this.user, this.isEditPage = false});

  @override
  State<AddEditUser> createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future<void> _handleSubmitFormApi() async {
    Map<String, dynamic> user = {
      NAME: _nameController.text.toString(),
      EMAIL: _emailController.text.toString()
    };

    await UserApi.addUser(user: user);

    Navigator.pop(context, user);
  }

  Future<void> _handleEditFormApi() async {
    Map<String, dynamic> user = {
      ID: widget.user![ID],
      NAME: _nameController.text.toString(),
      EMAIL: _emailController.text.toString()
    };

    await UserApi.editUser(user: user);


    Navigator.pop(context, user);
  }

  Future<void> _handleSubmitForm() async {
    Map<String, dynamic> user = {
      NAME: _nameController.text.toString(),
      EMAIL: _emailController.text.toString()
    };

    int userId = await User.addUser(user: user);

    if (userId < 0) {
      print("error in adding user");
      return;
    }
    Navigator.pop(context, user);
  }

  Future<void> _handleEditForm() async {
    Map<String, dynamic> user = {
      ID: widget.user![ID],
      NAME: _nameController.text.toString(),
      EMAIL: _emailController.text.toString()
    };

    int userId = await User.editUser(user: user);

    if (userId < 0) {
      print("error in adding user");
      return;
    }

    Navigator.pop(context, user);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isEditPage) {
      _nameController.text = widget.user![NAME];
      _emailController.text = widget.user![EMAIL];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add edit User",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          _buildInputBox(text: "Name", controller: _nameController),
          _buildInputBox(text: "Email", controller: _emailController),
          ElevatedButton(
            onPressed: widget.isEditPage ? _handleEditFormApi : _handleSubmitFormApi,
            child: Text(
              widget.isEditPage ? "Edit" : "Submit",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBox(
      {required String text, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: text,
          hintText: text,
        ),
      ),
    );
  }
}
