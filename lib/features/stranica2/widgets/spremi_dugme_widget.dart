import 'package:flutter/material.dart';

class SpremiDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const SpremiDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.save),
      tooltip: 'Spremi promjene',
      onPressed: onPressed,
    );
  }
}
