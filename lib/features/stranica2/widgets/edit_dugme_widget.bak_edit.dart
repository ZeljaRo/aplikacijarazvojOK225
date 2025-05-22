import 'package:flutter/material.dart';

class EditDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const EditDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: onPressed,
    );
  }
}
