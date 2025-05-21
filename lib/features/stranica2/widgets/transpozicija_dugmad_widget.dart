import 'package:flutter/material.dart';

class TranspozicijaDugmadWidget extends StatelessWidget {
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  const TranspozicijaDugmadWidget({
    super.key,
    required this.onPlus,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: onMinus,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: onPlus,
        ),
      ],
    );
  }
}
