import 'package:flutter/material.dart';

class LupaDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const LupaDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: onPressed,
    );
  }
}
