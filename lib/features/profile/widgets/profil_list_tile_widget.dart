import 'package:flutter/material.dart';
import '../models/profil.dart';

class ProfilListTileWidget extends StatelessWidget {
  final Profil profil;
  final VoidCallback onActivate;

  const ProfilListTileWidget({
    super.key,
    required this.profil,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(profil.ime),
      subtitle: Text(profil.mapa, style: const TextStyle(fontSize: 12)),
      trailing: ElevatedButton(
        onPressed: onActivate,
        child: const Text('Aktiviraj'),
      ),
    );
  }
}
