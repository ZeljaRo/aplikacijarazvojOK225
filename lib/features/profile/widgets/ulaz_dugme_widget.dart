import 'package:flutter/material.dart';

class UlazDugmeWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String ime;

  const UlazDugmeWidget({
    super.key,
    required this.onPressed,
    required this.ime,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('ULAZ za: ', style: const TextStyle(fontSize: 16)),
    );
  }
}
