import 'package:flutter/material.dart';

class OdaberiMapuDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const OdaberiMapuDugmeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Odaberi mapu'),
    );
  }
}
