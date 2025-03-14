import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_work/add_edit/user_entry_page.dart';
import 'package:lecture_work/design/login/login_page.dart';

class TabularViewDemo extends StatelessWidget {
  const TabularViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab View Example"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.car_crash),
                text: "Car",
              ),
              Tab(
                icon: Icon(Icons.bike_scooter),
                text: "Bike",
              ),
              Tab(
                icon: Icon(Icons.car_crash),
                text: "Car",
              ),
              Tab(
                icon: Icon(Icons.bike_scooter),
                text: "Bike",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: getTabPages(),
        ),
      ),
    );
  }

  List<Widget> getTabPages() {
    List<Widget> tabPages = [];
    for (int i = 1; i <= 4; i++) {
      tabPages.add(i%2==0 ? UserEntryPage() : LoginPage());
    }
    return tabPages;
  }
}
