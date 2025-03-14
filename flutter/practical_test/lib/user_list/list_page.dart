import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical_test/user/add_edit_user.dart';
import 'package:practical_test/user_management/user.dart';
import 'package:practical_test/user_management/user_api.dart';
import 'package:practical_test/utils/string_const.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // late List<Map<String, dynamic>> users;

  Future<void> _handleDelete({required int id}) async {
    int userId = await User.deleteUser(id: id);

    if (userId < 0) {
      return;
    }

    setState(() {});
  }

  Future<void> _handleDeleteApi({required String id}) async {
    await UserApi.deleteUser(userId: id);


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "User List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditUser(),
              )).then(
            (value) {
              setState(() {});
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: UserApi.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return _listViewForUsers(users: snapshot.data!, context: context);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _listViewForUsers(
      {required List<dynamic> users, required context}) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _createCard(user: users[index], context: context),
      itemCount: users.length,
    );
  }

  Widget _createCard({required Map<String, dynamic> user, required context}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 20,
        child: ListTile(
          trailing: ElevatedButton(
            onPressed: () {
              print("::: from handle delete :::");
              print(user[ID]);
              _handleDeleteApi(id: user[ID]);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          title: Text(user[NAME]),
          subtitle: Text(user[EMAIL]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditUser(
                    user: user,
                    isEditPage: true,
                  ),
                )).then(
              (value) {
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
