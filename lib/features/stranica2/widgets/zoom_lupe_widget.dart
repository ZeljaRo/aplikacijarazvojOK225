import 'package:flutter/material.dart';

class ZoomLupeWidget extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;

  const ZoomLupeWidget({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.zoom_out),
          onPressed: onZoomOut,
        ),
        IconButton(
          icon: const Icon(Icons.zoom_in),
          onPressed: onZoomIn,
        ),
      ],
    );
  }
}
