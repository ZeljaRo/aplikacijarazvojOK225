import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spremanje_modular/features/profile/services/aktivni_profil_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profil = AktivniProfilService.dohvati();
    if (profil == null) {
      return const Scaffold(
        body: Center(child: Text('Nema aktivnog profila')),
      );
    }

    final files = Directory(profil.mapa)
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.txt'))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Odaberi pjesmu')),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          final ime = file.uri.pathSegments.last;

          return ListTile(
            title: Text(ime),
            onTap: () {
              context.go('/stranica2?file=');
            },
          );
        },
      ),
    );
  }
}
