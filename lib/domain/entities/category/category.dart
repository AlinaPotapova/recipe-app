import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Category extends Equatable {
  final IconData icon;
  final String label;
  final Color color;

  const Category({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
