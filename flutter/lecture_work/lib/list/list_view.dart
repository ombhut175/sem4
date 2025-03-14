import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_work/add_edit/user_entry_page.dart';
import 'package:lecture_work/crud/user.dart';
import 'package:lecture_work/utils/string_const.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  bool isGridView = false;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  final User _user = User();
  List<Map<String, dynamic>> searchedValue = [];
  List<Map<String, dynamic>> userList = [
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
    {NAME: "OM", AGE: 18, CITY: "RAJKOT", EMAIL: "OM@GMAIL.COM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return UserEntryPage();
            },
          )).then((value) async {
            await _user.addUser(user: value);
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: isSearching
            ? TextField(
                controller: searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Searching...",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      searchedValue = [];
                    } else {
                      searchedValue =
                          _user.searchDetailUsingEmail(searchData: value);
                    }
                  });
                },
              )
            : const Text(
                "Grid & List Demo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              isSearching = !isSearching;
              if (!isSearching) {
                searchController.clear();
                searchedValue = [];
              }
              setState(() {});
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              isGridView = true;
              setState(() {});
            },
            icon: const Icon(Icons.grid_view),
          ),
          IconButton(
            onPressed: () {
              isGridView = false;
              setState(() {});
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: isSearching
                  ? searchedValue.isEmpty
                      ? const Center(
                          child: Text(
                            "No User Found",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return getListView(index);
                          },
                          itemCount: searchedValue.length,
                        )
                  : _user.userList.isEmpty
                      ? const Center(
                          child: Text(
                            "No User Found",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : isGridView
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return getGridView(index);
                              },
                              itemCount: _user.userList.length,
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                return getListView(index);
                              },
                              itemCount: _user.userList.length,
                            ),
            )
          ],
        ),
      ),
    );
  }

  Widget getListView(i) {
    List<Map<String, dynamic>> uList =
        isSearching ? searchedValue : _user.userList;
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserEntryPage(
              userDetail: uList[i],
            );
          })).then((value) async {
            await _user.addUser(user: value);
            setState(() {});
          });
        },
        leading: Image.asset(
          "assets/images/default-profile-account.jpg",
          errorBuilder: (context, error, stackTrace) {
            return const Text("Failed to load image");
          },
        ),
        trailing: deleteButton(i),
        title: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            Text(
              '${uList[i][NAME]}',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        subtitle: Text(
          "${uList[i][EMAIL]} - ${uList[i][CITY]} - ${uList[i][AGE]}",
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget getGridView(i) {
    return Card(
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(
                "assets/images/default-profile-account.jpg",
                height: 150,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Text(
                "${_user.userList[i][NAME]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                "${_user.userList[i][EMAIL]} - ${_user.userList[i][CITY]} - ${_user.userList[i][AGE]}",
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: deleteButton(i),
            )
          ],
        ));
  }

  Widget deleteButton(i) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text("Delete User"),
                content:
                    const Text("Are you sure you want to delete this user?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      _user.userList.removeAt(i);
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No"),
                  )
                ],
              );
            });
      },
      autofocus: true,
      hoverColor: Colors.blue,
      child: const Icon(Icons.delete),
    );
  }

  Widget getListGridItem(i) {
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {},
        leading: Image.asset('assets/images/download.jpeg'),
        trailing: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('DELETE'),
                      content: Text('Are you sure want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _user.deleteUserById(id: i);
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('yes'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('No'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
            ),
          ],
        ),
        title: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              '${_user.userList[i][NAME]}',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Text(
              '${_user.userList[i][CITY]} | ${_user.userList[i][EMAIL]}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
