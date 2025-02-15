import 'package:flutter/material.dart';

import 'components/dashboard_drawer.dart';
import 'components/dashboard_header.dart';
import 'components/itemlist_cards.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Create GlobalKey

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int columns = (screenWidth / 100).floor();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: const Center(child: Text("Dashboard")),
        leading: IconButton(
          icon: const Icon(Icons.menu), // Hamburger icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Opens the drawer
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), // Bell icon
            onPressed: () {
              // Add notification logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notification clicked")),
              );
            },
          ),
        ],
      ),
      drawer: const DashboardDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DashboardHeader(
                name: "John Doe",
                admissionNumber: "18001",
                className: "Class 3(A)",
                imgSrc: "https://picsum.photos/200/300"),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    color: Colors.black,
                    height: 4,
                    margin: const EdgeInsets.only(top: 10),
                  ),
                  const SizedBox(height: 30),
                  dashboardCards(columns),
                  const SizedBox(height: 20),
                  dashboardCards(columns),
                  const SizedBox(height: 20),
                  dashboardCards(columns),
                  const SizedBox(height: 20),
                  dashboardCards(columns),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCards(int columns) {
    var list = [
      "Homework",
      "Daily Assignment",
      "Lesson Plan",
      "Online Examination",
      "Download Center",
      "Online Course",
      "Zoom Live Classes",
      "Gmeet Live Classes"
    ];
    return ItemListCard(
      list: list,
      columns: columns,
      cardTitle: "E-Learning",
    );
  }
}
