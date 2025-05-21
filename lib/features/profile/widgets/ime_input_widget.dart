import 'package:flutter/material.dart';

class ImeInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const ImeInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Ime profila'),
    );
  }
}
