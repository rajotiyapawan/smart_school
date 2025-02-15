import 'package:flutter/material.dart';

import 'image_text_item.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({
    super.key,
    required this.list,
    required this.columns,
    required this.cardTitle,
  });

  final List<String> list;
  final int columns;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(12),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cardTitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 8, // Spacing between columns
                    mainAxisSpacing: 8, // Spacing between rows
                    childAspectRatio: 1, // Square items
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ImageTextItem(
                      icon: "",
                      text: list[index],
                      press: () {},
                    );
                  })
            ],
          ),
        ));
  }
}
