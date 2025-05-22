import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pretra�ivanje'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Tra�i pjesmu',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
