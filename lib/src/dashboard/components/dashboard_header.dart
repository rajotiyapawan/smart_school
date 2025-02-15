import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String imgSrc;
  final String name;
  final String admissionNumber;
  final String className;

  const DashboardHeader({
    super.key,
    required this.imgSrc,
    required this.name,
    required this.admissionNumber,
    required this.className,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.lightBlue[100],
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: ClipOval(
                child: CachedNetworkImage(imageUrl: imgSrc, fit: BoxFit.cover, width: 100, height: 100,)),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Admission No. $admissionNumber   $className",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
