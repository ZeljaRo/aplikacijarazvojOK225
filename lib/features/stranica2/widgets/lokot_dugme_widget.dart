import 'package:flutter/material.dart';

class LokotDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const LokotDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.lock),
      onPressed: onPressed,
    );
  }
}
