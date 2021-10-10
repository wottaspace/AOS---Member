import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class FilterController extends OkitoController {
    FilterController._internal();
  static final FilterController _singleton = FilterController._internal();

  factory FilterController() {
    return _singleton;
  }

  final TextEditingController searchController = TextEditingController();

  List<String> selectedCategories = [];
  String? selectedProximity;
  String? hourlyRate;

  void selectCategory(String category) {
    if (!selectedCategories.contains(category)) {
      selectedCategories.add(category);
    } else {
      selectedCategories.remove(category);
    }
    setState(() { });
  }
}
