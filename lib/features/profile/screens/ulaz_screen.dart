import 'package:flutter/material.dart';

class UlazScreen extends StatelessWidget {
  final String imeProfila;

  const UlazScreen({super.key, required this.imeProfila});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ULAZ')),
      body: Center(
        child: Text('Ušli ste u profil: ',
            style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
