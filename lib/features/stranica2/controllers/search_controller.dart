import 'package:flutter/material.dart';
import 'package:spremanje_modular/features/search/screens/search_screen.dart';

class SearchController {
  static void otvoriPretragu(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchScreen()),
    );
  }
}
