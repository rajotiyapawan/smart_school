import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/core/routes/app_routes.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 30, 16,16),
            color: Colors.lightBlue[100],
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Close drawer
                    },
                  ),
                ),
                const Row(
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
                    Navigator.pushNamed(context, AppRoutes.profile);
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
                const Divider(),
                const Center(
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
    );
  }
}
