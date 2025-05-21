import 'package:flutter/material.dart';

class SpremiDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SpremiDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Spremi profil'),
    );
  }
}
