import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/back_strelica_widget.dart';
import '../widgets/lupa_dugme_widget.dart';
import '../widgets/transpozicija_dugmad_widget.dart';
import '../widgets/lokot_dugme_widget.dart';
import '../widgets/inout_dugme_widget.dart';
import '../widgets/zoom_lupe_widget.dart';
import '../widgets/spajalica_dugme_widget.dart';
import '../widgets/edit_dugme_widget.dart';
import '../widgets/spremi_dugme_widget.dart';
import '../widgets/opcije_dugme_widget.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/search_controller.dart' as moj_search;
import 'package:spremanje_modular/features/profile/services/aktivni_profil_service.dart';

class Stranica2Screen extends StatefulWidget {
  final String imeFajla;
  const Stranica2Screen({super.key, required this.imeFajla});

  @override
  State<Stranica2Screen> createState() => _Stranica2ScreenState();
}

class _Stranica2ScreenState extends State<Stranica2Screen> {
  bool editMod = false;
  TextEditingController textController = TextEditingController();
  String ucitaniTekst = '';

  @override
  void initState() {
    super.initState();
    _ucitajTekst();
  }

  Future<void> _ucitajTekst() async {
    final profil = AktivniProfilService.dohvati();
    if (profil == null) return;
    final path = profil.mapa + '/' + widget.imeFajla;
    final file = File(path);
    if (await file.exists()) {
      final text = await file.readAsString();
      setState(() {
        ucitaniTekst = text;
        textController.text = text;
      });
    }
  }

  Future<void> _spremiTekst() async {
    final profil = AktivniProfilService.dohvati();
    if (profil == null) return;
    final path = profil.mapa + '/' + widget.imeFajla;
    final file = File(path);
    await file.writeAsString(textController.text);
    setState(() {
      ucitaniTekst = textController.text;
      editMod = false;
    });
  }

  void _toggleEdit() {
    setState(() {
      if (editMod) {
        _spremiTekst();
      } else {
        editMod = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackStrelicaWidget(
              onPressed: () => NavigationController.vratiNazad(context),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TranspozicijaDugmadWidget(onPlus: () {}, onMinus: () {}),
                  const SizedBox(width: 8),
                  LokotDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  InOutDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  ZoomLupeWidget(onZoomIn: () {}, onZoomOut: () {}),
                  const SizedBox(width: 8),
                  SpajalicaDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  editMod ? SpremiDugmeWidget(onPressed: _spremiTekst) : EditDugmeWidget(onPressed: _toggleEdit),
                  const SizedBox(width: 8),
                  OpcijeDugmeWidget(onPressed: () {}),
                ],
              ),
            ),
            LupaDugmeWidget(
              onPressed: () => moj_search.SearchController.otvoriPretragu(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: editMod
            ? TextField(
                controller: textController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Uredi tekst pjesme',
                ),
              )
            : (ucitaniTekst.isEmpty
                ? const Center(child: Text('Nema teksta za prikaz.'))
                : SingleChildScrollView(
                    child: Center(
                      child: Text(
                        ucitaniTekst,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  )),
      ),
    );
  }
}


