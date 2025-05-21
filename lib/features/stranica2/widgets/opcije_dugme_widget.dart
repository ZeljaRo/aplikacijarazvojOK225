import 'package:flutter/material.dart';

class OpcijeDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const OpcijeDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: onPressed,
    );
  }
}
