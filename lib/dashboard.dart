import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.lightBlue[100],
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Close drawer
                      },
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: CachedNetworkImageProvider("https://picsum.photos/200/300"), // Replace with actual image
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Doe", // Replace with dynamic data
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Class 3(A)", // Replace with designation
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Profile"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text("About School"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text("Logout"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Divider(),
                  Center(
                    child: Text(
                      "Version 1.0.0", // Replace with actual version
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.lightBlue[100],
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 50, backgroundColor: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Software Engineer",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 40, color: Colors.black, height: 4, margin: EdgeInsets.only(top: 10)),
                  SizedBox(height: 30),
                  dashbooardCards(columns),
                  SizedBox(height: 20),
                  dashbooardCards(columns),
                  SizedBox(height: 20),
                  dashbooardCards(columns),
                  SizedBox(height: 20),
                  dashbooardCards(columns),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashbooardCards(int columns) {
    return Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(12),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("E-Learning", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 8, // Spacing between columns
                    mainAxisSpacing: 8, // Spacing between rows
                    childAspectRatio: 1.5, // Square items
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Icon(Icons.book), SizedBox(height: 8), Text("Homework", style: TextStyle(fontSize: 12))],
                    );
                  })
            ],
          ),
        ));
  }
}
