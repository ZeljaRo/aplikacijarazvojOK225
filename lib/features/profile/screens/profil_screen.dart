import 'package:flutter/material.dart';
import '../models/profil.dart';
import '../controllers/profil_controller.dart';
import '../widgets/ime_input_widget.dart';
import '../widgets/odaberi_mapu_dugme_widget.dart';
import '../widgets/spremi_dugme_widget.dart';
import '../widgets/profil_list_tile_widget.dart';
import '../widgets/ulaz_dugme_widget.dart';
import 'package:file_selector/file_selector.dart';
import 'package:spremanje_modular/features/stranica2/screens/stranica2_screen.dart';
import '../services/aktivni_profil_service.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final ProfilController controller = ProfilController();
  final TextEditingController imeController = TextEditingController();
  String? odabranaMapa;
  Profil? aktivni;

  @override
  void initState() {
    super.initState();
    controller.ucitaj().then((_) {
      setState(() {});
    });
  }

  Future<void> odaberiMapu() async {
    final path = await getDirectoryPath();
    if (path != null) setState(() => odabranaMapa = path);
  }

  Future<void> spremiProfil() async {
    final ime = imeController.text.trim();
    if (ime.isEmpty || odabranaMapa == null) return;
    await controller.dodajProfil(ime, odabranaMapa!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spremanje profila')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Unos profila', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            ImeInputWidget(controller: imeController),
            const SizedBox(height: 8),
            OdaberiMapuDugmeWidget(onPressed: odaberiMapu),
            if (odabranaMapa != null)
              Text(odabranaMapa!, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 8),
            SpremiDugmeWidget(onPressed: spremiProfil),
            const Divider(height: 32),
            const Text('Spremljeni profili', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: controller.profili.length,
                itemBuilder: (context, index) {
                  final p = controller.profili[index];
                  return ProfilListTileWidget(
                    profil: p,
                    onActivate: () => setState(() => aktivni = p),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            if (aktivni != null)
              UlazDugmeWidget(
                ime: aktivni!.ime,
                onPressed: () {
                  AktivniProfilService.postavi(aktivni!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Stranica2Screen(imeFajla: 'demo.txt'),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

