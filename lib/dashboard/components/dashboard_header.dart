import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class dashboard_header extends StatelessWidget {
  final String imgSrc;
  final String name;
  final String admissionNumber;
  final String className;

  const dashboard_header({
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
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: CachedNetworkImage(imageUrl: imgSrc),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Admission No. $admissionNumber   $className",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
