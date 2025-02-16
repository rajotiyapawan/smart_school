import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const CommonScaffold({required this.child, this.title = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background Design
          Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
          ),
          // Main Content
          child,
        ],
      ),
    );
  }
}
