import 'package:flutter/material.dart';
import 'package:spremanje_modular/features/profile/services/aktivni_profil_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aktivni = AktivniProfilService.dohvati();
    final mapa = aktivni?.mapa ?? 'nema mape';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pretraživanje'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Traži pjesmu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text("Mapa: "),
          ],
        ),
      ),
    );
  }
}
