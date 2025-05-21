import 'package:flutter/material.dart';

class InOutDugmeWidget extends StatefulWidget {
  final VoidCallback? onPressed;

  const InOutDugmeWidget({super.key, this.onPressed});

  @override
  State<InOutDugmeWidget> createState() => _InOutDugmeWidgetState();
}

class _InOutDugmeWidgetState extends State<InOutDugmeWidget> {
  bool jeOut = true;

  void _toggle() {
    setState(() {
      jeOut = !jeOut;
    });
    if (widget.onPressed != null) widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _toggle,
      child: Text(jeOut ? 'OUT' : 'IN'),
    );
  }
}
