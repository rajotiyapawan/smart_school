import 'package:flutter/material.dart';

class ImageTextItem extends StatelessWidget {
  final String icon;
  final String text;
  final Function press;

  const ImageTextItem({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.book),
          const SizedBox(height: 8),
          Flexible(
              child: Text(
            text,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
