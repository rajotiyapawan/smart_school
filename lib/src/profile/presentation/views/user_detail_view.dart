import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/core/utils/text_style.dart';

class UserDetailView extends StatelessWidget {
  const UserDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edward Thomas",
                  style: bold(fontSize: 16),
                ),
                Text(
                  "Class 3-A (2023-24)",
                  style: semibold(fontSize: 12),
                ),
                Text(
                  "Adm. No. 18001",
                  style: semibold(fontSize: 12)
                ),
                Text(
                  "Roll Number 121",
                  style: semibold(fontSize: 12),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                    child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                )),
                const Text(
                  "Behaviour Score: 20",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
