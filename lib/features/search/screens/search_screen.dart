import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spremanje_modular/features/profile/services/aktivni_profil_service.dart';
import 'package:spremanje_modular/features/stranica2/screens/stranica2_screen.dart';

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
    if (!permission.isGranted) return;

    final profil = AktivniProfilService.dohvati();
    final folderPath = profil?.mapa;
    if (folderPath == null) return;

    final folder = Directory(folderPath);
    if (!folder.existsSync()) return;

    final txtFiles = folder
        .listSync()
        .whereType<File>()
        .where((f) => f.path.toLowerCase().endsWith('.txt'))
        .map((f) => f.uri.pathSegments.last)
        .toList();

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

    return Scaffold(
      appBar: AppBar(title: const Text('Pretra�ivanje')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: _filterSongs,
              decoration: const InputDecoration(
                labelText: 'Tra�i pjesmu',
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Stranica2Screen(imeFajla: song),
                        ),
                      );
                    },
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
