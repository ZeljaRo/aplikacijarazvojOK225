import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spremanje_modular/features/profile/services/aktivni_profil_service.dart';

class TekstPrikazWidget extends StatelessWidget {
  final String imeFajla;
  const TekstPrikazWidget({super.key, required this.imeFajla});

  @override
  Widget build(BuildContext context) {
    final profil = AktivniProfilService.dohvati();
    if (profil == null) {
      return const Center(child: Text('Nema aktivnog profila'));
    }

    final path = profil.mapa + '/' + imeFajla;
    final file = File(path);

    return FutureBuilder<String>(
      future: file.readAsString(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Greska pri ucitavanju'));
        }

        return Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Center(
              child: Text(
                snapshot.data ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
