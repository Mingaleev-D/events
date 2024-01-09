import 'package:flutter/material.dart';

import '../../../../data/model/mock.dart';
import 'event_category_item.dart';

class EventCategory extends StatelessWidget {
  const EventCategory(
      {super.key,
      required this.activeCategory,
      required this.onCategorySelected});

  final String activeCategory;
  final Function(String category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return EventCategoryItem(
              isActive: categories[index] == activeCategory,
              text: categories[index],
              isFirst: index == 0,
              isLast: index == categories.length - 1,
              onTap: () => onCategorySelected(categories[index]),
            );
          },
        ),
      ),
    );
  }
}
