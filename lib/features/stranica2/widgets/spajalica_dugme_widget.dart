import 'package:flutter/material.dart';

class SpajalicaDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SpajalicaDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.attach_file),
      onPressed: onPressed,
    );
  }
}
