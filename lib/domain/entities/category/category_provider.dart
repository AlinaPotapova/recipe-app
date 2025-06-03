import 'package:flutter/material.dart';

import 'category.dart';

class CategoryProvider {
  final List<Category> _categories = const [
    Category(
      icon: Icons.egg,
      label: 'Chicken',
      color: Color.fromARGB(255, 185, 243, 187),
    ),
    Category(
      icon: Icons.set_meal,
      label: 'Beef',
      color: Color.fromARGB(255, 244, 241, 211),
    ),
    Category(
      icon: Icons.fiber_dvr_outlined,
      label: 'Fish',
      color: Color.fromARGB(255, 244, 241, 211),
    ),
    Category(
      icon: Icons.account_circle,
      label: 'Random',
      color: Color.fromARGB(255, 244, 241, 211),
    ),
  ];

  List<Category> get categories => _categories;
}
