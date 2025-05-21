import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profil.dart';

class ProfilStorageService {
  static const _key = 'profili_json';

  Future<void> spremi(List<Profil> profili) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(profili.map((e) => e.toJson()).toList());
    await prefs.setString(_key, json);
  }

  Future<List<Profil>> ucitaj() async {
    final prefs = await SharedPreferences.getInstance();
    final tekst = prefs.getString(_key);
    if (tekst == null) return [];
    final decoded = jsonDecode(tekst) as List;
    return decoded.map((e) => Profil.fromJson(e)).toList();
  }
}
