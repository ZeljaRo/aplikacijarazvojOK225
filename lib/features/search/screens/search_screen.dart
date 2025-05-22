import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spremanje_modular/features/profile/services/aktivni_profil_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> allSongs = [];
  List<String> filteredSongs = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  Future<void> _loadSongs() async {
    final permission = await Permission.manageExternalStorage.request();
    if (!permission.isGranted) {
      debugPrint(" STORAGE dozvola NIJE odobrena.");
      return;
    }

    final profil = AktivniProfilService.dohvati();
    final folderPath = profil?.mapa;
    if (folderPath == null) {
      debugPrint(" Nema postavljene mape u profilu");
      return;
    }

    final cleaned = folderPath
        .replaceAll('file:///', '')
        .replaceAll('file://', '')
        .replaceAll('/', Platform.pathSeparator)
        .replaceAll('\\', Platform.pathSeparator);

    debugPrint(" Provjeravam folder: " + cleaned);

    final folder = Directory(cleaned);
    if (!folder.existsSync()) {
      debugPrint(" Folder NE postoji!");
      return;
    }

    final files = folder.listSync();
    for (var file in files) {
      debugPrint(" Fajl u mapi: " + file.path);
    }

    final txtFiles = files
        .whereType<File>()
        .where((f) => f.path.toLowerCase().endsWith('.txt'))
        .map((f) => f.uri.pathSegments.last)
        .toList();

    debugPrint(" Pronaðeni .txt fajlovi: " + txtFiles.toString());

    setState(() {
      allSongs = txtFiles;
      filteredSongs = txtFiles;
    });
  }

  void _filterSongs(String query) {
    setState(() {
      searchQuery = query;
      filteredSongs = allSongs
          .where((song) => song.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profil = AktivniProfilService.dohvati();
    debugPrint(" PROFIL: " + (profil?.ime ?? 'null') + " | MAPA: " + (profil?.mapa ?? 'null'));

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
            TextField(
              onChanged: _filterSongs,
              decoration: const InputDecoration(
                labelText: 'Traži pjesmu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSongs.length,
                itemBuilder: (context, index) {
                  final song = filteredSongs[index];
                  return ListTile(
                    title: Text(song),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
