import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pretra�ivanje')),
      body: const Center(
        child: Text('Ovdje dolazi pretraga pjesama'),
      ),
    );
  }
}
